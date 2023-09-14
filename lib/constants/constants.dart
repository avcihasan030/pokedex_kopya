import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._(); //  we made the constructor private, so nobody can instantiate this class

  static const String title = 'Pokedex';

  static TextStyle getTitleStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(48),
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(24),
    );
  }

  static TextStyle getTypeChipStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(20),
    );
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.5).sp;
    }
  }

  static TextStyle getPokeInfoTextStyle() {
    return TextStyle(
      fontSize: _calculateFontSize(16),
      color: Colors.black87,
    );
  }

  static TextStyle getPokeInfoLabelTextStyle() {
    return TextStyle(
      fontSize: _calculateFontSize(20),
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    );
  }
}
