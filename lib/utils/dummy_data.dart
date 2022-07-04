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

List<OfferModel> offers = [
  OfferModel(
    title: "Wait ! Grab FREE reward",
    description: "Book your seats and tap on the reward box to claim it.",
    expiry: DateTime(2022, 4, 15, 12),
    startTime: DateTime(2022, 3, 15, 12),
    discount: 100,
    color: ThemeColor.redTextColor,
    gradientColor: ThemeColor.redGiftGradientColors,
    
  ),
  OfferModel(
    title: "Wait ! Grab FREE reward",
    description: "Book your seats and tap on the reward box to claim it.",
    expiry: DateTime(2022, 4, 15, 12),
    startTime: DateTime(2022, 3, 15, 12),
    discount: 100,
    color: ThemeColor.greenTextColor,
    gradientColor: ThemeColor.greenGiftGradientColors,
    icon: "gift_green.svg",
  ),
];
List<MovieModel> movies = [
   MovieModel(
    title: "Black Panther",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 100,
    bannerUrl: "assets/movies/movie5.png",
  ),
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
  'Ho Chi Minh',
  'Ha Noi',
  'Vung Tau',
  'Da Nang',
  'Hai Phong',
  'Nha Trang',
  'Can Tho',
  'Bien Hoa',
];

List<CastModel> casts = [
  CastModel(
    movieId: "123",
    castId: "123",
    name: "Chadwick",
    image: "assets/actors/chadwick.png",
  ),
  CastModel(
    movieId: "123",
    castId: "123",
    name: "Letitia Wright",
    image: "assets/actors/LetitiaWright.png",
  ),
  CastModel(
    movieId: "123",
    castId: "123",
    name: "B. Jordan",
    image: "assets/actors/b_jordan.png",
  ),
  CastModel(
    movieId: "123",
    castId: "123",
    name: "Lupita Nyong",
    image: "assets/actors/lupita_nyong.png",
  ),
];

List<TheatreModel> theatres = [
  TheatreModel(id: "1", name: "CGV Vincom Center Landmark 81"),
  TheatreModel(id: "2", name: "BHD Star Bitexco"),
  TheatreModel(id: "3", name: "Lotte Cinema Cantavil"),
  TheatreModel(id: "4", name: "Galaxy Cinema - Nguyen Du"),
  TheatreModel(id: "5", name: "DDC - Tran Hung Dao"),
  TheatreModel(id: "6", name: "Cinestar - Nguyen Trai"),
];

List<String> facilityAsset = [
  "assets/icons/cancel.svg",
  "assets/icons/parking.svg",
  "assets/icons/cutlery.svg",
  "assets/icons/rocking_horse.svg",
];

List<String> screens = [
  "3D",
  "2D",
];

final seatLayout = SeatLayoutModel(
    rows: 10,
    cols: 11,
    seatTypes: [
      {"title": "King", "price": 120.0, "status": "Filling Fast"},
      {"title": "Queen", "price": 100.0, "status": "Available"},
      {"title": "Jack", "price": 80.0, "status": "Available"},
    ],
    theatreId: 123,
    gap: 2,
    gapColIndex: 5,
    isLastFilled: true,
    rowBreaks: [5, 3, 2]);

final List<int> s = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];