import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class CommonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CommonController instance = Get.find();
  late TabController tabController;
  late List<Tab> tabs;
  late RxString screen;

  final tabList = ['Now showing', 'Coming soon', 'Exclusive'];
  final PageController pageController = PageController(keepPage: false, initialPage: 0,);
  
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
    screen = screens[0].obs;
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  updatePage(int index) async {
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
    
  }

  updateScreen(String screen) {
    this.screen = screen.obs;
    update();
  }
}
