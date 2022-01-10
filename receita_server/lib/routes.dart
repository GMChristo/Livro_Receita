import 'package:dotenv/dotenv.dart';
import 'package:file/file.dart';
import 'package:galileo_framework/galileo_framework.dart';
import 'package:receita_core/receita_core.dart';
import 'package:receita_server/middleware/postgresql_middleware.dart';
import 'package:receita_server/services/static_file_server/my_virtual_directory.dart';

import 'middleware/postgresql_middleware.dart';

///arquivo de rotas
GalileoConfigurer configureServer(FileSystem fileSystem) {
  return (Galileo app) async {
    app.get('/', (req, res) => res.write('Receita Server API'));

    //rotas publicas
    app.chain([PostgresqlMiddleware().handleRequest]).group(
        BackendRoutesPath.basePath, (router) {
      router.get(
          '/',
          (req, res) => res.write(
              'Receita Server API pontoInteresse ${BackendRoutesPath.pontoInteresse}'));
    });

    //rotas teste pessoa CRUD
    app.chain([PostgresqlMiddleware().handleRequest]).group(
        BackendRoutesPath.testePessoa, (router) {
      router.get(
          '/',
          (req, res) => res.write(
              'Receita Server API testePessoa ${BackendRoutesPath.testePessoa}'));
    });

    //CRUD ponto de interesse
    app.chain([PostgresqlMiddleware().handleRequest]).group(
        BackendRoutesPath.pontoInteresse, (router) {
      router.get(
          '/',
          (req, res) => res.write(
              'Receita Server API pontoInteresse ${BackendRoutesPath.pontoInteresse}'));
      // router.post('${BackendRoutesPath.pontoInteresse}', PontoInteresseController.incluirPontoInteresse);
      router.get('${BackendRoutesPath.pontoInteresse}/teste',
          (req, res) => res.write('ponto de Interesse teste'));
    });

    //isso vai servir os arquivos estaticos em desemvolvimento
    if (!app.environment.isProduction) {
      //STORAGE_PATH=C:\wamp64\www\  /var/www/html/
      final vDir = MyVirtualDirectory(app, fileSystem,
          source: fileSystem.directory(env['STORAGE_PATH']), //web
          callback: (f, rec, res) {
        res.headers['x-frame-options'] = '*';
        return true;
      });
      app.fallback(vDir.handleRequest);
    }

    // Throw a 404 if no route matched the request.
    app.fallback((req, res) => throw GalileoHttpException.notFound());

    final oldErrorHandler = app.errorHandler;
    app.errorHandler = (e, req, res) async {
      if (req.accepts('text/html', strict: true)) {
        if (e.statusCode == 404 && req.accepts('text/html', strict: true)) {
          await res
              .render('error', {'message': 'No file exists at ${req.uri}.'});
        } else {
          await res.render('error', {'message': e.message});
        }
      } else {
        return await oldErrorHandler(e, req, res);
      }
    };
  };
}
