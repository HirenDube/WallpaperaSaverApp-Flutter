import "package:flutter/material.dart";

import "Wallpaper App.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWallpaperApp(),
  ));
}

AppBar buildAppBar(
    {required String title, required Color bgColor, List<Widget>? actions, Color BgColor2nd = Colors.white,Color shadowColor = Colors.black}) {
  return AppBar(
    foregroundColor: BgColor2nd,
    title: Text(title),
    backgroundColor: bgColor,
    actions: actions,
    shadowColor: shadowColor,
  );
}
