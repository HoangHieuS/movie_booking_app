import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../utils/utils.dart';

class NoOfSeat extends StatelessWidget {
  final Function(int) onTap;
  const NoOfSeat({Key? key, required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        alignment: WrapAlignment.spaceAround,
        children: List.generate(
          s.length,
          (index) {
            SeatSelectionController controller = Get.find();
            return GestureDetector(
              onTap: () {
                onTap(index + 1);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: index + 1 == controller.noOfSeats.value
                      ? ThemeColor.greenColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: index + 1 == controller.noOfSeats.value
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
