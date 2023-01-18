import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

Widget FIELD(width, placeholder, controller, onChanged) {
  return Container(
    width: width,
    height: 70,
    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: TextField(
      cursorColor: GREEN,
      controller: controller,
      onChanged: onChanged,
      style: DEFAULT,
      decoration: InputDecoration(
        hintText: placeholder,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: GREY)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: GREY)),
        contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0)
      ),
    )
  );
}