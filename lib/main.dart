import 'package:carouselslider/screen/provider/homescreen_provider.dart';
import 'package:carouselslider/screen/view/homescreen_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'/': (context) => HomeScreen()},
      ),
    ),
  );
}
