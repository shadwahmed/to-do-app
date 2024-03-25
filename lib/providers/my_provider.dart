import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_app/firebase/firebase_function.dart';

import '../user_model.dart';

class MyProvider extends ChangeNotifier{
  User? firebaseUser;
  UserModel? userModel;

  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      initUser();
    }
  }

  initUser()async{
    userModel=await FirebaseFunctions.readUser();
    notifyListeners();
  }
}