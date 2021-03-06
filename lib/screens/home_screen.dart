import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/controllers.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.7721649, 106.7035503),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(10.771412, 106.708256),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  void initState() {
    SharedPrefController.getLocation()
        .then((value) => city = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: ThemeColor.statusBar));
    String? imgUrl = AuthController.instance.user!.photoURL;
    imgUrl = imgUrl ?? Constants.dummyAvatar;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: GestureDetector(
                onTap: () {
                  Get.to(const ProfileScreen());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imgUrl,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AuthController.instance.user!.displayName ?? 'Name'),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        Get.to(() => const SelectLocationScreen());
                      },
                      child: Row(
                        children: [
                          Text(
                            LocationController.instance.city.value,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              inherit: true,
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/search.svg'),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width,
                  color: Colors.red,
                  child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return CustomSlider(currentIndex: index);
                    },
                  ),
                ),
                const CustomCategory(categoryName: 'SEAT CATEGORIES'),
                const ListMenu(),
                const CustomCategory(categoryName: 'RECOMMENDED SEATS'),
                const MoviesItem(),
                const CustomCategory(
                  categoryName: 'NEARBY THEATRES',
                  isList: true,
                ),
                Container(
                  height: size.height * 0.2,
                  padding: const EdgeInsets.only(left: 20, right: 20),
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
                const CustomCategory(
                  categoryName: 'EVENTS',
                  isList: true,
                  isMovie: true,
                  svgUrl: 'assets/icons/spotlights.svg',
                ),
                ListItem(models: events),
                const CustomCategory(
                  categoryName: 'PLAYS',
                  isList: true,
                  isMovie: true,
                  svgUrl: 'assets/icons/theater_masks.svg',
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ListItem(models: plays),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
