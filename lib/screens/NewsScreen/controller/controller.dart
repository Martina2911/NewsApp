import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/models/NewsModel.dart';
import 'package:project2/services/NewServices.dart';

class NewsController extends GetxController{
  RxBool isLoading = false.obs;
  var selectedtype = "".obs;
  var selectedIndex = 0.obs;
  var currentIndex=0.obs;

  final PageController pageController = PageController();
  var arr=["business","entertainment","general","health","science","sports","technology"];

  void changeTap(int i) {
    selectedIndex.value = i;
  }

  void changePage(int index){
    currentIndex.value=index;
    changeTab(index);
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    selectedtype.value=arr[index];
    pageController.jumpToPage(index);
  }


  void changeTab(int index) {
    currentIndex.value=index;
    selectedtype.value=arr[index];
    fetchTypeArticle(selectedtype.value);

  }
  //on change tap / on pressed >>>> lazm ab3t al function ali ana 3mlaha hna flcontroller
  final article = <Articles>[].obs;

  fetchTypeArticle(id) async {
    isLoading.value = true;
    article.value =
        (await NewServices.fetchType(selectedtype.value))! as List<Articles>;
    isLoading.value = false;
  }

  @override
  onInit() async {
    super.onInit();
    (await fetchTypeArticle(selectedtype.value));
  }
}