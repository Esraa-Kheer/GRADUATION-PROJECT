import 'package:flutter/material.dart';

void navigateAndFinish(
    context,widget
    )=>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (route){
          return false;
        }
    );

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    //start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 2.0,
    color: Colors.grey[300],
  ),
);