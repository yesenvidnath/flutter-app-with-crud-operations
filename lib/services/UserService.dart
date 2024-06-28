import 'dart:async';
import 'package:fluttercrud/model/User.dart';
import 'package:fluttercrud/db_helper/repository.dart';


class Userservice{

  late Repository _repository;

  UserService(){
    _repository = Repository();
  }

  //Save User
  SaveUser(User user) async {
    return await _repository.insertData('users', user.userMap());
  }

  // Read All USers
  readAllUsers() async {
    return await _repository.readData('users');
  }
  
  // Edit User
  UpdateUser(User user) async {
    return await _repository.updateData('users', user.userMap());
  }

  // delete
  deleteUser(UserId) async {
    return await _repository.deleteDataByID('users', UserId);
  }

}