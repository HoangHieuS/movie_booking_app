import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  MenuModel menu = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchAction(),
              );
            },
            icon: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ],
      ),
      body: Container(),
    );
  }
}

class SearchAction extends SearchDelegate<String> {


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null.toString());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? movies
        : movies
            .where(
              (element) =>
                  element.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      itemBuilder: (_, index) {
        return Text(suggestionList[index].title);
      },
      itemCount: suggestionList.length,
    );
  }
}
