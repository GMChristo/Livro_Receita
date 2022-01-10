// import 'dart:io';
import 'package:essential_code_buffer/essential_code_buffer.dart';

class PreparaTemplate {
  PreparaTemplate();
  //Map<String, dynamic> data;

  Future<String> prepara(Map<String, dynamic> data, String fileName) async {
    //print(Platform.script); //file:///D:/MyDartProjects/portal_cmpop/visitacao_server/bin/dev.dart
    //print(Platform.script.toFilePath(windows: true)); //D:\MyDartProjects\portal_cmpop\visitacao_server\bin\dev.dart
    // print(Directory.current.absolute.path); // D:\MyDartProjects\portal_cmpop\visitacao_server
    // final file = File('${Directory.current.absolute.path}/lib/views/$fileName');
    // final template = await file.readAsString();
    final buf = CodeBuffer();
    // final doc = twig.parseDocument(template, sourceUrl: '$fileName', asDSX: false);
    // final formData = data;
    // final scope = SymbolTable(values: formData);
    // const twig.Renderer().render(doc, buf, scope);
    return buf.toString();
  }
}
