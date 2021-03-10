import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_tracker/Services/auth.dart';

class RegisterManager {
  RegisterManager({this.auth, this.isLoading});
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<User> register(Future<User> Function() registerMethod)async{
    try{
      isLoading.value = true;
      return await registerMethod();
    }catch(e){
      isLoading.value = false;
      rethrow;
    }
  }
}