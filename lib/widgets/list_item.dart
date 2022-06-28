import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ListItem extends StatelessWidget {
  final List<EventModel> models;

  const ListItem({
    Key? key,
    required this.models,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.25,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: models.length,
        itemBuilder: (_, i) {
          return ItemBlock(model: models[i], onTap: (model) {},);
        },
      ),
    );
  }
}
