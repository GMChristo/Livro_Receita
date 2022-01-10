import 'dart:async';
import 'package:dotenv/dotenv.dart' show load, env;
import 'package:file/local.dart';
import 'package:galileo_configuration/galileo_configuration.dart';
import 'package:galileo_cors/galileo_cors.dart';
import 'package:galileo_framework/galileo_framework.dart';
import 'package:receita_core/receita_core.dart';
import 'db_connect.dart';
import 'routes.dart' as routes;

/// Configures the server instance.
Future configureServer(Galileo app) async {
  // The default options will allow CORS for any request.
  // Combined with `fallback`, you can enable CORS application-wide.
  app.fallback(cors());
  //add Middleware de Authentication
  //app.fallback(AuthMiddleware().handleRequest);

  app.fallback((RequestContext req, ResponseContext res) {
    res.headers['Access-Control-Expose-Headers'] = '*';
    return true;
  });

  //carrega o arquivo .env
  load('.env');
  //db connect
  await dbConnect();
  // Grab a handle to the file system, so that we can do things like
  // serve static files.
  const fs = LocalFileSystem();

  if (env['APP_ENV'] == 'development') {
    //AppConfig.basePath = '/visitacao_server/api/v1';
  }

  print('boot_galileo.dart AppConfig.basePath ${BackendRoutesPath.basePath}');
  //file system config
  await app.configure(configuration(fs));
  //routes config
  await app.configure(routes.configureServer(fs));
}
