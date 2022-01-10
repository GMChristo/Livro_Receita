import 'package:angular/angular.dart';
import 'dart:html' as html;

import 'package:angular_forms/angular_forms.dart';

/*
!link de examplo:
https://consolelog.com.br/modal-animations-angular/
*/

@Component(
  selector: 'modal-test',
  templateUrl: 'modal_test.html',
  styleUrls: ['modal_test.css'],
  directives: [
    coreDirectives,
    formDirectives,
  ],
  // exports: [
  //   ModalTest,
  // ],
)
class ModalTest implements OnInit {
  ModalTest();

  bool showModal = false;

  void toggle() {
    showModal = !showModal;
  }

  @override
  void ngOnInit() {
    print('ModalTest@ngOnInit()');
  }
}
