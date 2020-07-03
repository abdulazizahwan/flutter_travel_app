class PopularModel {
  String image;
  int color;

  PopularModel(this.image, this.color);
}

List<PopularModel> populars = popularsData
    .map((item) => PopularModel(item['image'], item['color']))
    .toList();

var popularsData = [
  {"image": "assets/images/img_beach.png", "color": 0xFFFEF1ED},
  {"image": "assets/images/img_mountain.png", "color": 0xFFEDF6FE},
  {"image": "assets/images/img_lake.png", "color": 0xFFFEF6E8},
  {"image": "assets/images/img_river.png", "color": 0xFFEAF8E8},
];
