import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_trauxit/task%20two/states.dart';

class OnlineCubit extends Cubit<OnlineStates> {
  OnlineCubit() : super(InitOnlineState());
  static OnlineCubit get(context) => BlocProvider.of(context);
  Database? database;
  List<Map> cart = [];
  void createDatabase() {
    openDatabase('Online.db', version: 1, onCreate: (database, version) {
      print('DataBase Created');
      database
          .execute(
          'create table Cart(id INTEGER PRIMARY KEY,name TEXT , size TEXT , price TEXT,image TEXT)')
          .then((value) {
        print('Table 1 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
    }, onOpen: (database) {
      getCartData(database);
      print('Database opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    }).catchError((error) {
      emit(ErrorCreateDatabaseState());
    });
  }

  Future<void> insertCart(
      {required String name,
        required String size,
        required String price,
        required String image}) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO Cart(name,size,price,image) VALUES("$name","$size","$price","$image")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertCartState());
        getCartData(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertCartState());
      });
    });
  }

  void getCartData(database) {
    cart = [];
    database!.rawQuery('select * from Cart').then((value) {
      value.forEach((element) {
        cart.add(element);
      });
      print(cart);
      emit(GetCartState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorCartState());
    });
  }

  void deleteCartData({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Cart WHERE id= ?', [id]).then((value) {
      getCartData(database);
      emit(DeleteCartDataState());
    });
  }

}