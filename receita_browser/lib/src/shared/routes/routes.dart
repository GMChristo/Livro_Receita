import 'package:angular_router/angular_router.dart';
import 'package:receita_browser/src/shared/routes/route_paths.dart';
import 'package:receita_browser/src/modules/first_page/first_page.template.dart'
    as first_page_template;

// import 'package:visitacao_browser/src/modules/visitacao_formulario/visitacao_formulario.template.dart'
// as visitacao_formulario_template;

class Routes {
  static final firstPage = RouteDefinition(
    routePath: RoutePaths.firstPage,
    component: first_page_template.FirstPageNgFactory,
    useAsDefault: true,
  );

  // static final visitacaoFormulario = RouteDefinition(
  // routePath: RoutePaths.visitacaoFormulario,
  // component: visitacao_formulario_template.VisitacaoFormularioNgFactory,
  //   useAsDefault: true,
  // );

  static final all = <RouteDefinition>[
    // visitacaoFormulario,
    firstPage,
  ];
}
