import '../models/models.dart';
import '../utils/utils.dart';

List<AdSliderModel> sliderData = [
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
];

List<MenuModel> menus = [
  MenuModel(name: "Movies", asset: "assets/icons/film.svg"),
  MenuModel(name: "Events", asset: "assets/icons/spotlights.svg"),
  MenuModel(name: "Plays", asset: "assets/icons/theater_masks.svg"),
  MenuModel(name: "Sports", asset: "assets/icons/running.svg"),
  MenuModel(name: "Activity", asset: "assets/icons/flag.svg"),
  MenuModel(name: "Monum", asset: "assets/icons/pyramid.svg"),
];

List<MovieModel> movies = [
  MovieModel(
    title: "Bigil",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie1.png",
  ),
  MovieModel(
    title: "Kaithi",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie2.png",
  ),
  MovieModel(
    title: "Asuran",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie3.png",
  ),
  MovieModel(
    title: "Sarkar",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie4.png",
  ),
];

List<EventModel> events = [
  EventModel(
    title: "Bigil",
    description: "description",
    bannerUrl: "assets/events/event1.png",
    date: "date",
  ),
  EventModel(
    title: "Kaithi",
    description: "description",
    bannerUrl: "assets/events/event2.png",
    date: "date",
  ),
  EventModel(
    title: "Asuran",
    description: "description",
    bannerUrl: "assets/events/event3.png",
    date: "date",
  ),
  EventModel(
    title: "Sarkar",
    description: "description",
    bannerUrl: "assets/events/event4.png",
    date: "date",
  ),
];

List<EventModel> plays = [
  EventModel(
    title: "Bigil",
    description: "description",
    bannerUrl: "assets/plays/play1.png",
    date: "date",
  ),
  EventModel(
    title: "Kaithi",
    description: "description",
    bannerUrl: "assets/plays/play2.png",
    date: "date",
  ),
  EventModel(
    title: "Asuran",
    description: "description",
    bannerUrl: "assets/plays/play3.png",
    date: "date",
  ),
  EventModel(
    title: "Sarkar",
    description: "description",
    bannerUrl: "assets/plays/play4.png",
    date: "date",
  ),
];

List<String> cities = [
  'Vung Tau',
  'London',
  'New York',
  'Paris',
  'Tokyo',
  'Sydney',
  'Ha Noi',
  'Ho Chi Minh',
];
