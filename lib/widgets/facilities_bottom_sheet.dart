import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/controllers.dart';
import '../utils/utils.dart';

class FacilitiesBottomSheet extends StatelessWidget {
  final dynamic model;
  const FacilitiesBottomSheet({Key? key, this.model}) : super(key: key);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.7721649, 106.7035503),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(20),
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer())
                    },
                    onMapCreated: (GoogleMapController controller) {
                      // _controller.complete(controller);
                    },
                    zoomControlsEnabled: false,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                model.name,
                style: const TextStyle(fontSize: 18),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.location_on,
                        size: 25,
                        color: Color(0xFF999999),
                      ),
                    ),
                    TextSpan(
                      text: LocationController.instance.city.value,
                      style: const TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                model.fullAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF999999),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Facilities',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.facilites.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ThemeColor.redGiftGradientColors[0],
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                facilityAsset[index],
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                          Text(
                            model.facilites[index],
                            style: const TextStyle(
                              color: Color(0xff999999),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: Center(
            child: CircleAvatar(
              backgroundColor: ThemeColor.splash,
              radius: 40,
              child: SvgPicture.asset(
                'assets/icons/gps.svg',
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
