import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class SeatSelectionScreen extends StatefulWidget {
  final TheatreModel theatreModel;
  final MovieModel movieModel;
  const SeatSelectionScreen({
    Key? key,
    required this.theatreModel,
    required this.movieModel,
  }) : super(key: key);

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final SeatSelectionController seatController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      appBar: customAppBar(
        toggle: seatController.isSeatSelection,
        controller: seatController,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheatreBlock(
            model: widget.theatreModel,
            onTimeTap: seatController.timeSelectedIndex,
            isBooking: true,
          ),
          const SizedBox(height: 15),
          Obx(
            () => seatController.isSeatSelection.value
                ? SeatLayout(model: seatLayout)
                : noOfSeatSelection(seatController),
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(toggle: seatController.isSeatSelection, controller: seatController,),
    );
  }

  PreferredSizeWidget customAppBar({
    required Function(bool) toggle,
    required SeatSelectionController controller,
  }) {
    return AppBar(
      elevation: 0,
      title: Text(widget.movieModel.title),
      actions: [
        TextButton(
          onPressed: () {
            toggle(false);
          },
          child: Obx(
            () => Text(
              '${controller.noOfSeats < 0 ? 0 : controller.noOfSeats} Seats',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomBar({
    required Function(bool) toggle,
    required SeatSelectionController controller,
  }) {
    return BottomAppBar(
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child: ElevatedButton(
          onPressed: () {
            toggle(true);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: ThemeColor.splash,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Obx(
            () => Center(
              child: Text(
                controller.isSeatSelection.value ? 'Pay ${controller.seatPrice.value}' : 'Select Seats',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget noOfSeatSelection(SeatSelectionController controller) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'How Many Seats?',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: SvgPicture.asset(
                  'assets/icons/${controller.getAsset()}',
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            NoOfSeat(onTap: controller.noOfSeats),
            const SizedBox(height: 10),
            SeatType(onTap: controller.seatType),
          ],
        ),
      ),
    );
  }
}
