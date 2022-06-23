import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/widgets/item_block.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  MenuModel menu = Get.arguments;

  final selectedTxtStyle = const TextStyle(
    color: ThemeColor.splash,
    fontFamily: 'Poppins',
  );

  final unSelectedTxtStyle = const TextStyle(
    color: Colors.black45,
    fontFamily: 'Poppins',
  );

  late List<dynamic> list;

  @override
  void initState() {
    if (menu.name.contains('Event')) {
      list = events;
    } else if (menu.name.contains('Movie')) {
      list = movies;
    } else {
      list = plays;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${menu.name} in ${LocationController.instance.city}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchAction(
                  list: list,
                  isMovie: (menu.name.toLowerCase().contains('movies')),
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: TabBar(
              tabs: CommonController.instance.tabs,
              controller: CommonController.instance.tabController,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: ThemeColor.splash,
                  width: 3,
                ),
                insets: EdgeInsets.all(15),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              labelStyle: selectedTxtStyle,
              unselectedLabelStyle: unSelectedTxtStyle,
              labelColor: ThemeColor.splash,
              unselectedLabelColor: Colors.black45,
              isScrollable: false,
              enableFeedback: false,
              onTap: (index) => CommonController.instance.updatePage(index),
            ),
          ),
          Expanded(
            flex: 8,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: CommonController.instance.pageController,
              itemCount: 3,
              itemBuilder: (_, index) {
                return LayoutBuilder(
                  builder: (context, constraint) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraint.maxWidth > 480 ? 4 : 2,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (_, index) {
                        return ItemBlock(
                          model: list[index],
                          height: 180,
                          width: 150,
                        );
                      },
                      itemCount: list.length,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchAction extends SearchDelegate<String> {
  final bool isMovie;
  final List<dynamic> list;

  SearchAction({
    this.isMovie = false,
    required this.list,
  });

  Widget resultWidget(dynamic model) {
    return ItemBlock(
      model: model,
      height: 180,
      width: 150,
      isMovie: isMovie,
    );
  }

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
        ? list
        : list
            .where(
              (element) =>
                  element.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return LayoutBuilder(
      builder: (context, constraint) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraint.maxWidth > 480 ? 4 : 2,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (_, index) {
            return resultWidget(suggestionList[index]);
          },
          itemCount: suggestionList.length,
        );
      },
    );
  }
}
