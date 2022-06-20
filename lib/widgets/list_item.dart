import 'package:flutter/material.dart';
import 'package:movie_booking_app/models/models.dart';

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
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: GestureDetector(
              onTap: () {
                debugPrint(models[i].title);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      models[i].bannerUrl,
                      height: 150,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    models[i].title,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.6)),
                  ),
                  Text(
                    models[i].description,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
