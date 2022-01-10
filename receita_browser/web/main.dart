import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:receita_browser/src/modules/app/app_component.template.dart'
    as ng;
import 'main.template.dart' as self;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

@GenerateInjector([
  routerProvidersHash, // You can use routerProviders in production
  // ClassProvider(BackendRepository),
  // ClassProvider(RestConfigBase, useClass: AppConfig),
  // ClassProvider(CategoriaApi),
  // ClassProvider(FormularioInscricaoApi),
  // ClassProvider(AuthService),
  // ClassProvider(MidiaRepository),
  // ClassProvider(RouterHook, useClass: RouterGuard),
])
final InjectorFactory injector = self.injector$Injector;
void main() {
  initDateFormat();
  runApp(
    ng.AppComponentNgFactory,
    createInjector: injector,
  );
}

void initDateFormat() {
  initializeDateFormatting('pt_BR', null);
  Intl.defaultLocale = 'pt_BR';
}
