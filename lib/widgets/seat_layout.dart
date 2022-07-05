import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';

import '../utils/utils.dart';

class SeatLayout extends StatelessWidget {
  final SeatLayoutModel model;
  SeatLayout({
    Key? key,
    required this.model,
  }) : super(key: key);

  int alphabetCounter = -1;
  int seatCounter = 0;
  double amount = 0.0;

  @override
  Widget build(BuildContext context) {
    int seatLength = model.seatTypes.length;
    final SeatSelectionController controller = Get.find();
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/screen_here.svg'),
          const Text("Screen Here"),
          const SizedBox(height: 10),
          Expanded(
            child: InteractiveViewer(
              panEnabled: true,
              child: ListView.builder(
                itemCount: seatLength,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '\u20B9 ${model.seatTypes[seatLength - index - 1]['price']} ${model.seatTypes[seatLength - index - 1]['title']}'),
                          const SizedBox(height: 10),
                          ...List.generate(
                            model.rowBreaks[index],
                            (row) {
                              alphabetCounter++;
                              seatCounter = 0;
                              String rowNo =
                                  String.fromCharCode(65 + alphabetCounter);
                              return Wrap(
                                children: List.generate(
                                  model.cols,
                                  (col) {
                                    if (col == 0) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Text(rowNo),
                                        ),
                                      );
                                    }

                                    if ((col == model.gapColIndex ||
                                            col ==
                                                model.gapColIndex +
                                                    model.gap -
                                                    1) &&
                                        (row != model.rowBreaks[index] - 1 &&
                                            model.isLastFilled)) {
                                      return const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                        ),
                                      );
                                    }

                                    seatCounter++;
                                    double price =
                                        model.seatTypes[seatLength - index - 1]
                                            ['price'];

                                    return seatAction(
                                      seatPrice: controller.seatPrice,
                                      rowNo: rowNo,
                                      price: price,
                                      controller: controller,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget seatAction({
    required Function(double) seatPrice,
    required String rowNo,
    required double price,
    required SeatSelectionController controller,
  }) {
    String seatNo = '$seatCounter';
    RxList seats = controller.selectedSeats;
    RxList seatPriceList = controller.seatPrices;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          if (seats.contains('$rowNo$seatNo')) {
            seats.remove('$rowNo$seatNo');
            seatPriceList.remove(price);
          } else {
            if (seats.length >= controller.noOfSeats.value) {
              seats.removeAt(0);
              seatPriceList.removeAt(0);
              seats.add('$rowNo$seatNo');
              seatPriceList.add(price);
            } else {
              seats.add('$rowNo$seatNo');
              seatPriceList.add(price);
            }
          }
          amount = seatPriceList.fold(0, (prev, e) => prev + e);
          seatPrice(amount < 0 ? 0.0 : amount);
        },
        child: Obx(
          () {
            Color bgColor = seats.contains('$rowNo$seatNo')
                ? ThemeColor.greenColor
                : const Color(0xFFFFFFFF);
            Color boderColor = seats.contains('$rowNo$seatNo')
                ? ThemeColor.greenColor
                : const Color(0xff707070);
            Color textColor =
                seats.contains('$rowNo$seatNo') ? Colors.white : Colors.black87;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: bgColor,
                border: Border.all(
                  width: 0.5,
                  color: boderColor,
                ),
              ),
              child: Center(
                child: Text(
                  seatNo,
                  style: TextStyle(color: textColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
