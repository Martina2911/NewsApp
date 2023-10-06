import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../components/emptydata.dart';
import '../../components/loadingData.dart';
import '../../components/tabComp.dart';
import 'controller/controller.dart';

class NewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          bottom:
          PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child:
            TabBar(
              isScrollable: true,
              tabs:
            [
              const Tab(text: 'business',),
              const Tab(text: 'entertainment',),
              const Tab(text: 'general',),
              const Tab(text: 'health',),
              const Tab(text: 'science',),
              const Tab(text: 'sports',),
              const Tab(text: 'technology',),
            ],
            onTap: (index) => controller.changeTab(index),
          ),),
          title: Text("Breaking News"),backgroundColor: Colors.indigo[800],
        ),
        body:
        // PageView.builder(
        //   controller: controller.pageController, // Use the PageController from the controller
        //   itemCount: 7,
        //   onPageChanged: (index) {
        //     controller.changePage(index); // Update the selected tab when swiping
        //   },
        //   itemBuilder: (context, index) {
        //     return Obx(
        //           () => !controller.isLoading.value
        //           ? (controller.article.isNotEmpty
        //           ? customListView(controller: controller)
        //           : EmptyData())
        //           : LoadingData(),
        //     );
        //   },
        // ),
        //dlw2ty alloading alawl b false , lma andh 3la al controller.isloading w 2l2ih b true yb2a kda bd2 y fetch al function
        //         //f ! true b false yb2a kda hi3ml al circularprogress
        //         // lma tb2a b false b2a yb2a 5ls fetching lldata  ! false b true f kda habd2 as2l aldata msh fadia ? lw ah bktb Empty ,
        //         // lw la brg3 listview w akml 3ady
        /******************/
       TabBarView(
        // controller: controller.pageController,
          children: [
            Obx(() => !controller.isLoading.value ? (controller.article.isNotEmpty ?
            customListView(controller: controller)
                :  EmptyData())
                : LoadingData(),
            ),
       Obx(() => !controller.isLoading.value ? (controller.article.isNotEmpty ?
       customListView(controller: controller)
        :  EmptyData())
        : LoadingData(),
    ),
            Obx(() => !controller.isLoading.value ? (controller.article.isNotEmpty ?
            customListView(controller: controller)
                :  EmptyData())
                : LoadingData(),
            ),
            Obx(() => !controller.isLoading.value ? (controller.article.isNotEmpty ?
            customListView(controller: controller)
                :  EmptyData())
                : LoadingData(),
            ),
            Obx(() => !controller.isLoading.value ? (controller.article.isNotEmpty ?
            customListView(controller: controller)
                :  EmptyData())
                : LoadingData(),
            ),
            Obx(() => !controller.isLoading.value ? (controller.article.isNotEmpty ?
            customListView(controller: controller)
                :  EmptyData())
                : LoadingData(),
            ),
            Obx(() => !controller.isLoading.value ? (controller.article.isNotEmpty ?
            customListView(controller: controller)
                :  EmptyData())
                : LoadingData(),
            ),
         ],
         ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12, // Shadow color
                  offset: Offset(0, -4), // Offset to move the shadow up
                  blurRadius: 4, // Spread of the shadow
                ),
              ],
            ),
            child: Obx(() => BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.indigo[800],
            selectedLabelStyle: TextStyle(color: Colors.indigo[800]),
            unselectedLabelStyle: TextStyle(color: Colors.black),
            unselectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Colors.indigo[800]),
            unselectedIconTheme: IconThemeData(color: Colors.black),
            currentIndex: controller.selectedIndex.value,
            onTap: (int i) {
              controller.changeTap(i);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_library_outlined),
                  label: "For you",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_headline_sharp),
                  label: 'Headlines',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_border_outlined),
                  label: 'Following',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_graph),
                  label: 'Newsstand',
                  backgroundColor: Colors.white),
            ],
          ),
        ),
      ),)
    );
  }
}

