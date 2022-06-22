import 'package:flutter/material.dart';
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
          return ItemBlock(
            model: movies[i],
            isMovie: true,
          );
        },
      ),
    );
  }
}
