import 'package:flutter/material.dart';
import '../theme/fonts.dart';

Widget BUTTON(color, width, onTap, text) {
  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      color: color,
                      child: Text(text, style: TITLE_WHITE, textAlign: TextAlign.center,),
                      width: width,
                      height: 60,
                    ),
                    onTap: onTap,
                  );
}