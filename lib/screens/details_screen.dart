import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/screens/list_cinema_screen.dart';
import '../widgets/widgets.dart';
import '../utils/utils.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);

  final dynamic model = Get.arguments[0];
  final int index = Get.arguments[1];

  Widget movieInfo(model) => Container(
        width: double.maxFinite,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movieHeader(),
            const SizedBox(height: 5),
            movieRelease(),
            const SizedBox(height: 10),
            movieLangAndFormat(),
            const SizedBox(height: 10),
            movieDescription(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() =>  ListCinemaScreen(model: model));
          },
          style: ElevatedButton.styleFrom(
            primary: ThemeColor.splash,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/armchair.svg',
                  color: Colors.white,
                  height: 20,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Book Seats',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: ThemeColor.appBarColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(model.title),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: '${model.title}$index',
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/movie_banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: const Color(0xFFF5F5FA),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    movieInfo(model),
                    const SizedBox(height: 20),
                    const MovieOffer(),
                    const SizedBox(height: 20),
                    const MovieReview(),
                    const SizedBox(height: 20),
                    const MovieCast(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget movieRelease() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'UA | Oct 15, 2019',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        Text(
          '1.8K votes',
          style: TextStyle(
            color: ThemeColor.splash,
          ),
        ),
      ],
    );
  }

  Widget movieDescription() {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            child: Icon(
              Icons.history,
              size: 15,
              color: Colors.black45,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(width: 10),
          ),
          const TextSpan(
            text: '2h 59m',
            style: TextStyle(color: Colors.black45),
          ),
          const WidgetSpan(
            child: SizedBox(width: 10),
          ),
          WidgetSpan(
            child: SvgPicture.asset(
              'assets/icons/theater_masks.svg',
              height: 15,
              width: 15,
              color: Colors.black45,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(width: 10),
          ),
          const TextSpan(
            text: 'Action, Drama',
            style: TextStyle(color: Colors.black45),
          ),
        ],
      ),
    );
  }

  Widget movieLangAndFormat() {
    return Row(
      children: [
        const Text(
          'English',
          style: TextStyle(
            color: ThemeColor.splash,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: ThemeColor.splash.withOpacity(0.1),
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const Text(
            '3D',
            style: TextStyle(
              color: ThemeColor.splash,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: ThemeColor.splash.withOpacity(0.1),
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const Text(
            '2D',
            style: TextStyle(
              color: ThemeColor.splash,
            ),
          ),
        ),
      ],
    );
  }

  Widget movieHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Black Panther -  The King',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.favorite,
              color: ThemeColor.splash,
            ),
            const SizedBox(width: 5),
            Text(
              '${model.like}%',
              style: const TextStyle(fontSize: 10),
            )
          ],
        )
      ],
    );
  }
}
