import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:siascleaning/data/model/order.dart';
import 'package:siascleaning/data/model/user.dart';

import 'model/question.dart';

class ProviderValues extends ChangeNotifier {
  UserModel? loggedInUser;
  List<Question>? qAndAnswers = [];
  List<Order>? myOrders = [];

  Future<void> getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
    });
  }

  Future<void> fetchQuestions() async {
    QuerySnapshot querySnapshot;
    List<Question> qs = [];
    try {
      querySnapshot =
          await FirebaseFirestore.instance.collection('questions').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var question in querySnapshot.docs.toList()) {
          Question a = Question.fromMap(question.data());
          qs.add(a);
        }
        notifyListeners();
        qAndAnswers = [];
        qAndAnswers = qs;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      throw ('$e');
    }
  }

  Future<void> fetchMyOrders() async {
    QuerySnapshot querySnapshot;
    List<Order> orders = [];
    try {
      querySnapshot =
          await FirebaseFirestore.instance.collection('orders').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var order in querySnapshot.docs.toList()) {
          Order a = Order.fromMap(order.data());
          orders.add(a);
        }
        myOrders = [];

        for (var order in orders.toList()) {
          Order a = order;
          if (loggedInUser?.uid == a.id) {
            myOrders?.add(a);
          }
          orders.add(a);
        }
        notifyListeners();
      }
      // Fluttertoast.showToast(msg: "Successfully order sent !!!");
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      throw ('$e');
    }
  }

  Future<void> postOrder(Order? order) async {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc()
        .set(order!.toMap())
        .then((value) {
      Fluttertoast.showToast(msg: "Order sent successfully !!! ");
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    });
  }

  Future<void> postQuestion(Question? question) async {
    await FirebaseFirestore.instance
        .collection('questions')
        .doc()
        .set(question!.toMap())
        .then((value) {
      Fluttertoast.showToast(msg: "Question added successfully");
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    });
  }

  List<Question>? getQuestions() {
    return qAndAnswers;
  }

  List<Order>? getOrders() {
    return myOrders;
  }
}
