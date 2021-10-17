import 'package:Ndiulor/config/palette.dart';
import 'package:flutter/material.dart';

InputDecoration registerInputDecoration({String hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical:18.0),
    hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
    hintText: hintText,
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2)
    ),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Palette.amberDAccent),
  ),
focusedErrorBorder: const UnderlineInputBorder(
  borderSide: BorderSide(width: 2.0, color: Palette.amberDAccent),
),
errorStyle: const TextStyle(color: Colors.white),
  );
}

InputDecoration signInInputDecoration({String hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical:18.0),
    hintStyle: const TextStyle(fontSize: 18),
    hintText: hintText,
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Palette.blueGrey)
    ),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Palette.blueGrey),
  ),
focusedErrorBorder: const UnderlineInputBorder(
  borderSide: BorderSide(width: 2.0, color: Palette.blueGrey),
),
errorStyle: const TextStyle(color: Colors.redAccent),
  );
}




