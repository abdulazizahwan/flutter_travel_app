class BeachModel {
  String image;

  BeachModel(this.image);
}

List<BeachModel> beaches =
    beachesData.map((item) => BeachModel(item['image'])).toList();

var beachesData = [
  {
    "image":
        "https://images.unsplash.com/photo-1501950183564-3c8ac97d08f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  },
  {
    "image":
        "https://images.unsplash.com/photo-1546484475-7f7bd55792da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
  },
  {
    "image":
        "https://images.unsplash.com/photo-1539609413529-1166774c3954?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"
  },
  {
    "image":
        "https://images.unsplash.com/photo-1573790387438-4da905039392?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=666&q=80"
  },
  {
    "image":
        "https://images.unsplash.com/photo-1508317824427-18d2323490fd?ixlib=rb-1.2.1&auto=format&fit=crop&w=676&q=80"
  },
  {
    "image":
        "https://images.unsplash.com/photo-1591152348786-b37131d37840?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  },
  {
    "image":
        "https://images.unsplash.com/photo-1540690448301-9f7ead5263ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1268&q=80"
  },
];
