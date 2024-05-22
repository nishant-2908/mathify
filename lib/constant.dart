import 'package:flutter/material.dart';

AppBar? appbar = AppBar(
  elevation: 20,
  title: const Text("Welcome to Mathify!"),
  centerTitle: true,
);

TextStyle? h1 = const TextStyle(
  fontSize: 20,
);

TextStyle? h2 = const TextStyle(
  fontSize: 19,
);

TextStyle? option = const TextStyle(color: Colors.black, fontSize: 18);

TextStyle? answer_sup =
    const TextStyle(fontSize: 18, fontFeatures: [FontFeature.superscripts()]);

TextStyle? unit_sup =
    const TextStyle(fontSize: 14, fontFeatures: [FontFeature.superscripts()]);

TextStyle? mainAnswer = const TextStyle(fontSize: 24);

final List<String> unitsV = ["m2", "mm2", "cm2"];
final List<String> unitsM = ["m", "mm", "cm"];

final List<String> unitsV2 = ["m3", "mm3", "cm3"];
