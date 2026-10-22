import 'package:dallini/constant/const_colors.dart';
import 'package:flutter/material.dart';

class ConstStyle {


  static final TextStyle title=TextStyle(
    fontWeight: .bold,
    color: ConstColors.primary,
    fontSize: 20
  );
  static final TextStyle subTitile=TextStyle(
    fontWeight: .bold,
    color: ConstColors.secondary,
    fontSize: 18
  );




  static final TextStyle textButtonStyle=TextStyle(
    color: Colors.white
  );
  static final ButtonStyle buttonStyle=ElevatedButton.styleFrom(
    backgroundColor: ConstColors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
    ),
    
  );
}