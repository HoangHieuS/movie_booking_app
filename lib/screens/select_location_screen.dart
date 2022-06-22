import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:movie_booking_app/controllers/controllers.dart';
import 'package:movie_booking_app/screens/home_screen.dart';

import '../utils/utils.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(LocationController());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Obx(
            () {
              return LoadingOverlay(
                isLoading: LocationController.instance.isLocating.value,
                color: ThemeColor.statusBar,
                progressIndicator: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(ThemeColor.appBarColor),
                ),
                opacity: 0.5,
                child: Container(
                  height: size.height,
                  width: size.width,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myLocation(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cities.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: constraints.maxWidth > 680 ? 5 : 3,
                            childAspectRatio: 2.3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              LocationController.instance
                                  .setCity(cities[index]);
                              Get.offAll(() => const HomeScreen());
                            },
                            child: suggestedLocation(cities[index]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 30,
                              minHeight: 30,
                            ),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: Colors.black45,
                              ),
                            ),
                            hintStyle: const TextStyle(color: Colors.black45),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: ThemeColor.greyColor,
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget suggestedLocation(String city) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black45,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(city),
      ),
    );
  }

  Widget myLocation() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () async {
          LocationController.instance.isLocating(true);
          await LocationController.instance.getLocation();
          Get.offAll(() => const HomeScreen());
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.my_location,
              color: Colors.black45,
            ),
            SizedBox(width: 15),
            Text(
              'My Current Location',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
