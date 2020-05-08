// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class Styles {
  static const responsePageHeadlineTitle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 36,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const responsePageHeadlineDescription = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'NotoSans',
    fontSize: 19,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const requestPageHeadlineTitle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const requestPageCategoryTitle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const requestPageCategoryDescription = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const registerPageHeadNormalTitle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const registerPageHeadBoldTitle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const registerPageBottomNormalTitle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 19,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const questionPageTitle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const questionPageDefaultItem = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const questionPageSelectedItem = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const headlineName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const headlineDescription = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const cardTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 25,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const cardSubText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 23,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const cardMatchRateText = TextStyle(
    color: Colors.white,
    fontFamily: 'NotoSans',
    fontSize: 13,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const cardDetailText = TextStyle(
    color: Colors.black,
    fontFamily: 'NotoSans',
    fontSize: 13,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const cardCategoryText = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const cardDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const detailsTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const detailsPreferredCategoryText = TextStyle(
    color: Color.fromRGBO(0, 80, 0, 0.7),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const detailsCategoryText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.7),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const detailsDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const detailsBoldDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const detailsServingHeaderText = TextStyle(
    color: Color.fromRGBO(176, 176, 176, 1),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const detailsServingLabelText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static const detailsServingValueText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const detailsServingNoteText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const triviaFinishedTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 32,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const triviaFinishedText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const triviaFinishedBigText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 48,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const appBackground = Color(0xffd0d0d0);

  static const scaffoldBackground = Color(0xfff0f0f0);

  static const searchBackground = Color(0xffe0e0e0);

  static const frostedBackground = Color(0xccf8f8f8);

  static const closeButtonUnpressed = Color(0xff101010);

  static const closeButtonPressed = Color(0xff808080);

  static const TextStyle searchText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);

  static const seasonBorder = Border(
    top: BorderSide(color: Color(0xff606060)),
    left: BorderSide(color: Color(0xff606060)),
    bottom: BorderSide(color: Color(0xff606060)),
    right: BorderSide(color: Color(0xff606060)),
  );

  static const uncheckedIcon = IconData(
    0xf372,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const checkedIcon = IconData(
    0xf373,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const transparentColor = Color(0x00000000);

  static const shadowColor = Color(0xa0000000);

  static const shadowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [transparentColor, shadowColor],
  );

  static const Color settingsMediumGray = Color(0xffc7c7c7);

  static const Color settingsItemPressed = Color(0xffd9d9d9);

  static const Color settingsLineation = Color(0xffbcbbc1);

  static const Color settingsBackground = Color(0xffefeff4);

  static const Color settingsGroupSubtitle = Color(0xff777777);

  static const Color iconBlue = Color(0xff0000ff);

  static const Color iconGold = Color(0xffdba800);

  static const preferenceIcon = IconData(
    0xf443,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const calorieIcon = IconData(
    0xf3bb,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const checkIcon = IconData(
    0xf383,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const servingInfoBorderColor = Color(0xffb0b0b0);

  static const ColorFilter desaturatedColorFilter =
      // 222222 is a random color that has low color saturation.
      ColorFilter.mode(Color(0xFF222222), BlendMode.saturation);
}
