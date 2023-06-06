import 'package:flutter/material.dart';

SnackBar customSnackBar({required String errMessage}){
  return SnackBar(
    content: Text(errMessage),
    backgroundColor: Colors.grey,
    duration: const Duration(seconds: 2),
  );
}