
import 'package:dotenv/dotenv.dart' show env;
import 'package:fluent_query_builder/fluent_query_builder.dart';

final pgsqlComInfo = DBConnectionInfo(
    enablePsqlAutoSetSearchPath: true,
    reconnectIfConnectionIsNotOpen: true,
    host: env['DB_HOST'], //192.168.133.13
    database: env['DB_NAME'],
    driver: ConnectionDriver.pgsql,
    port: int.tryParse(env['DB_PORT']),
    username: env['DB_USERNAME'],
    password: env['DB_PASSWORD'],
    charset: 'utf8',
    schemes: ['public'],
    setNumberOfProcessorsFromPlatform: false,
    numberOfProcessors: 8,
  );
