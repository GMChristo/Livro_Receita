import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:receita_browser/src/shared/routes/route_paths.dart';
import 'package:receita_browser/src/shared/routes/routes.dart';

@Component(
    selector: 'my-app',
    styleUrls: ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: [
      coreDirectives,
      formDirectives,
      routerDirectives,
    ],
    exports: [
      Routes,
      RoutePaths,
    ])
class AppComponent {
  AppComponent();
}
