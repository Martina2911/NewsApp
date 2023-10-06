import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blueGrey,width: 3.0),
              color: Colors.white54,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],),
            child: Center(child: Text("Empty",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))));
  }
}

