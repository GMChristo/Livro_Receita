import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:receita_browser/src/modules/app/modal_test/modal_test.dart';

@Component(
  selector: 'first-page',
  templateUrl: 'first_page.html',
  styleUrls: ['first_page.css'],
  directives: [
    coreDirectives,
    formDirectives,
    routerDirectives,
    ModalTest,
  ],
  exports: [],
)
class FirstPage implements OnInit {
  bool showModal = false;
  FirstPage();

  @override
  void ngOnInit() {
    print('FirstPage@ngOnInit');
  }
}
