import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/controllers.dart';
import '../utils/utils.dart';

class CustomCalendar extends StatelessWidget {
  CustomCalendar({Key? key}) : super(key: key);

  final todayDate = DateTime.now();
  final DateFormat date = DateFormat('EEEE, MMM dd, yyyy');
  CalendarController calendarController = Get.find();

  var days =
      DateFormat.E(Platform.localeName).dateSymbols.STANDALONENARROWWEEKDAYS;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            date.format(calendarController.selectedMovieDate.value),
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const Divider(),
        const SizedBox(height: 20),
        Row(
          children: List.generate(
            8,
            (index) {
              if (index == 0) {
                return Container(width: 40);
              }

              String text = index < 7 ? days[index] : days[0];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(text),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(
            8,
            (index) {
              if (index == 0) {
                return const SizedBox(
                  width: 40,
                  child: Text(
                    'This week',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 10),
                  ),
                );
              }
              DateTime text = calendarController.thisWeek[index - 1];

              final DateFormat date = DateFormat('dd');
              bool isSelected = this.date.format(text) ==
                  this.date.format(calendarController.selectedMovieDate.value);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    if (text.isBefore(
                        todayDate.subtract(const Duration(days: 1)))) {
                      AuthController.instance
                          .getErrorSnackBarNew('Cannot select previous date');
                      return;
                    }
                    calendarController.updateMovieDate(text);
                    Navigator.pop(
                        context, calendarController.selectedMovieDate.value);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isSelected
                          ? ThemeColor.splash
                          : const Color(0xfff8f8f8),
                    ),
                    child: Text(
                      date.format(calendarController.thisWeek[index - 1]),
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black54),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(
            8,
            (index) {
              if (index == 0) {
                return const SizedBox(
                  width: 40,
                  child: Text(
                    'Next week',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 10),
                  ),
                );
              }

              DateTime text = calendarController.nextWeek[index - 1];
              final DateFormat date = DateFormat('dd');
              bool isSelected =
                  text == calendarController.selectedMovieDate.value;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    calendarController.updateMovieDate(text);
                    Navigator.pop(
                        context, calendarController.selectedMovieDate.value);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isSelected
                          ? ThemeColor.splash
                          : const Color(0xfff8f8f8),
                    ),
                    child: Text(
                      date.format(calendarController.nextWeek[index - 1]),
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black54),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
