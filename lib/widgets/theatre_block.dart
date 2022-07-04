import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class TheatreBlock extends StatelessWidget {
  final TheatreModel model;
  final Function(int) onTimeTap;
  final bool isBooking;

  const TheatreBlock({
    Key? key,
    required this.model,
    this.isBooking = false,
    required this.onTimeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var instance = CalendarController.instance;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(maxHeight: size.height * 0.63),
                    builder: (_) => FacilitiesBottomSheet(model: model),
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black45.withOpacity(0.3),
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          isBooking
              ? Text(
                  instance.format.format(instance.selectedMovieDate.value),
                  style: const TextStyle(color: Color(0xff999999)),
                )
              : RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.location_on,
                          size: 15,
                          color: Color(0xFF999999),
                        ),
                      ),
                      TextSpan(
                        text: '${LocationController.instance.city.value}, ',
                        style: const TextStyle(color: Color(0xFF999999)),
                      ),
                      const TextSpan(
                        text: '2.3km Away',
                        style: TextStyle(
                          color: Color(0xFF444444),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(height: 10),
          Obx(
            () => Wrap(
              runSpacing: 10,
              spacing: 20,
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) {
                  bool isSelected = index ==
                          SeatSelectionController
                              .instance.timeSelectedIndex.value &&
                      isBooking;
                  Color color = index % 2 == 0
                      ? ThemeColor.greenColor
                      : ThemeColor.orangeColor;
                  return GestureDetector(
                    onTap: () => onTimeTap(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 95,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ThemeColor.greenColor
                            : const Color(0x22E5E5E5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: isSelected
                              ? ThemeColor.greenColor
                              : const Color(0xFFE5E5E5),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Center(
                        child: Text(
                          model.timings[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
}
