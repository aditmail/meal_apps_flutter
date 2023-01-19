import 'package:flutter/material.dart';
import 'package:meal_apps/screen/category_meal_screen.dart';

import 'screen/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 16,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
      },
    );
  }
}

//Notes: title are changed to headline6
//https://stackoverflow.com/questions/61312511/themedata-deprecated-title-argument
