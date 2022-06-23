import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CommonController instance = Get.find();
  late TabController tabController;
  late List<Tab> tabs;

  final tabList = ['Now showing', 'Coming soon', 'Exclusive'];
  final PageController pageController = PageController(keepPage: false);
  
  @override
  void onInit() {
    tabController = TabController(
      length: tabList.length,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 300),
    );
    tabController.animateTo(0);
    tabs = tabList.map((e) => Tab(text: e)).toList();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  updatePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    tabController.animateTo(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    update();
  }
}
