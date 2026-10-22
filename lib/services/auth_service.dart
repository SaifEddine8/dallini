import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthService {
   Future<String> signUp({
    required String email,
    required String password,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      FirebaseFirestore.instance
          .collection('usersCollection')
          .doc(credential.user!.uid)
          .set({'email': email.trim(), 'phone': phone.trim(), 'role': 'user'})
          .then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User Added Successfully')),
            ),
          )
          .catchError((error) => print("Failed to add user: $error"));

      return 'done';
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        return ('the password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('the account already exists for that email');
      }
    } catch (e) {
      return (e.toString());
    }
    return 'error';
  }


   Future login(String email,String password)async{
    try{
      final credential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return 'done';
    }on FirebaseAuthException catch(e){
      if(e.code=='invalid-email')
      {
        return 'invalid email';
      }
      else if(e.code=='invalid-credential')
      {
        return 'invalid credential';
      }
      return 'error';
    }
  }



   void signout() {
    FirebaseAuth.instance.signOut();
  }

}