import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project2/components/loadingData.dart';
import 'package:url_launcher/url_launcher.dart';
import '../NewsScreen/controller/controller.dart';

class DetailScreen extends StatelessWidget {
  final index;
  const DetailScreen({super.key, this.index});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(title:
      Row(
        children: [
          Text((controller.isLoading.value?"business":controller.selectedtype.value).capitalizeFirst!),
          Text(" News")
        ],
      ),backgroundColor: Colors.indigo[800],),
      body:SingleChildScrollView(
          child:
   //        Container(
   //      decoration: const BoxDecoration(
   //      image: DecorationImage(image:NetworkImage(
   //        "https://img.freepik.com/free-vector/global-technology-background-with-text-space_1017-19388.jpg"
   //         //"https://img.freepik.com/free-vector/earth-with-digital-network-connection-background_1017-33689.jpg"
   //          //"https://img.freepik.com/free-vector/network-communications-background-with-globe-design_1048-12361.jpg"
   //          //"https://img.freepik.com/free-photo/top-view-old-french-newspaper-pieces_23-2149318857.jpg"
   //      ),
   //          //"https://img.freepik.com/free-vector/global-technology-background-with-text-space_1017-19388.jpg"),
   //  fit: BoxFit.cover
   //  ),),
   // child:
   // BackdropFilter(filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
   //  child:
    Obx(
        () => !controller.isLoading.value ?Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "${controller.article[index].title}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20,),
            // controller.arr[index]=="business"?
            // Image.network("https://previews.123rf.com/images/maxkabakov/maxkabakov1310/maxkabakov131000477/22571921-news-concept-pixelated-words-business-news-on-digital-background-3d-render.jpg"
            //   //"https://www.hindustantimes.com/ht-img/img/2023/03/09/1600x900/breaking_blog_1678406159741_1678406159943_1678406159943.jpeg"
            //   //"https://i.pinimg.com/originals/b2/a7/8b/b2a78b7520577fc3664213e22bffd2c3.jpg",
            //   ,loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            //     if (loadingProgress == null) {
            //       return child;
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ):
           //controller.article[index].urlToImage!=null
            Image.network("https://img.freepik.com/free-vector/realistic-news-studio-background_23-2149985612.jpg"
              //"https://www.hindustantimes.com/ht-img/img/2023/03/09/1600x900/breaking_blog_1678406159741_1678406159943_1678406159943.jpeg"
              //"https://i.pinimg.com/originals/b2/a7/8b/b2a78b7520577fc3664213e22bffd2c3.jpg",
              ,loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
           // Image.network(" controller.article[index].urlToImage"),
            SizedBox(height:15,),
           Row(mainAxisAlignment:MainAxisAlignment.end,children:[Text(" ${controller.article[index].publishedAt}",style: TextStyle(fontWeight:FontWeight.w500,color: Colors.black,fontSize:15),),]),
           SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(15),
              child:Column(
                  children:[
              Row(mainAxisAlignment:MainAxisAlignment.start,children:[Text("For More Information :",style:
              TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.bold ),),]),
              SizedBox(height: 7,),
                GestureDetector(
                    onTap: () async {
                      var url = "${controller.article[index].url}"; // Replace with your URL
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child:
              Text("${controller.article[index].url}",style: TextStyle(color: Colors.indigo[800],decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: 15),),),
              SizedBox(height: 15,),
              Row( mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("By: ${controller.article[index].author}",style: TextStyle(fontWeight:FontWeight.w600,color: Colors.black,fontSize: 15),),
                    ],),
                    Row( mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Source: ${controller.article[index].source?.name}",style: TextStyle(fontWeight:FontWeight.w600,color: Colors.black,fontSize:15) ),
                      ],),
              ]))
          ],
        ):LoadingData(),
      ),
    )
      )
    //   )
    // )
    ;
  }
}
