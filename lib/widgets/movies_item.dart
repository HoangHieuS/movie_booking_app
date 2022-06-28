import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';
import '../utils/utils.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.28,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, i) {
          return Hero(
            tag: '${movies[i].title}$i',
            child: ItemBlock(
              model: movies[i],
              isMovie: true,
              onTap: (model) {
                Get.to(() =>  DetailsScreen(), arguments: [movies[i], i],);
              },
            ),
          );
        },
      ),
    );
  }
}
