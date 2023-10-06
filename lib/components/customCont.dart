import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/screens/DetailScreen/DetailScreen.dart';

class customCont extends StatelessWidget{
  final title;
  final index;
  const customCont({super.key, this.title, this.index});
  @override
  Widget build(BuildContext context) {
  return Padding(padding:EdgeInsets.all(10)
  ,child: GestureDetector(
      onTap: (){
        Get.to(DetailScreen(index: index,));
      },
      child:Container(
      width: 350,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.indigo[800]!,width: 3.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.indigo[800]!.withOpacity(0.7),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],),
    child:
          Text( "$title",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,),
    ),),
  );
  }

}