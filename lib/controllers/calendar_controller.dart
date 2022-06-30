import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  static CalendarController instance = Get.find();
  late Rx<DateTime> selectedMovieDate;
  final DateFormat format = DateFormat("EEEE, MMM dd, yyyy");
  final DateTime todayDate = DateTime.now();
  List<DateTime> thisWeek = [], nextWeek = [];

  @override
  void onReady() {
    selectedMovieDate = DateTime.now().obs;
    super.onReady();
  }

  updateWeekDay() {
    thisWeek = [];
    nextWeek = [];
    var weekday = todayDate.weekday;
    var week = weekday;

    DateTime thisWeekDate = todayDate.subtract(Duration(days: week - 1));

    for (int i = 0; i < 8; i++) {
      nextWeek.add(thisWeekDate.add(Duration(days: 7 + i)));
      thisWeek.add(thisWeekDate.add(Duration(days: i)));
    }
  }

  updateToInitialDate() {
    selectedMovieDate.value = DateTime.now();
    update();
  }

  updateMovieDate(DateTime date){
    selectedMovieDate = date.obs;
    update();
  }
}
