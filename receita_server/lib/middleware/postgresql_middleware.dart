import 'dart:async';
import 'package:galileo_framework/galileo_framework.dart';

import 'package:receita_server/db_connect.dart';

class PostgresqlMiddleware {
  Future<bool> handleRequest(RequestContext req, ResponseContext res) async {
    if (db.connectionInfo.host.isNotEmpty) {
      print('PostgresqlMiddleware dbConnect');
      await dbConnect();
    }
    return true;
  }
}
