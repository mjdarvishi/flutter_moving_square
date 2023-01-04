import 'package:floor/floor.dart';
import 'package:mc_crud_test/data/data_sources/local/DAOs/customer_dao.dart';
import 'package:mc_crud_test/data/data_sources/models/customer_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'database.g.dart';

@Database(version: 1, entities: [CustomerEntity])
abstract class AppDatabase extends FloorDatabase {
  CustomerDoa get personDao;
}