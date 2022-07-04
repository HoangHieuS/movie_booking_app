import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

import '../utils/utils.dart';

class SeatType extends StatelessWidget {
  final Function(int) onTap;
  const SeatType({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> seatTypeList = seatLayout.seatTypes;
    final SeatSelectionController controller = Get.find();
    return Obx(
      () => Wrap(
        alignment: WrapAlignment.spaceAround,
        children: List.generate(
          seatTypeList.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: index == controller.seatType.value
                      ? ThemeColor.greenColor
                      : const Color(0xFFFCFCFC),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 0.5,
                    color: index == controller.seatType.value
                        ? ThemeColor.greenColor
                        : const Color(0xFFE5E5E5),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      seatTypeList[index]['title'],
                      style: TextStyle(
                        color: index == controller.seatType.value
                            ? Colors.white
                            : const Color(0xFF999999),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\u20B9 ${seatTypeList[index]['price']}',
                      style: TextStyle(
                        color: index == controller.seatType.value
                            ? Colors.white
                            : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      seatTypeList[index]['status'],
                      style: TextStyle(
                        color: index == controller.seatType.value
                            ? Colors.white
                            : const Color(0xFF999999),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
