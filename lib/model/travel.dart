class Travel{
  String name;
  String location;
  String url;

  Travel(this.name,this.location,this.url);

  static List<Travel> generateTravelBlog(){
    return [
      Travel("name 1", "Place One", "assets/image/1.jpg"),
      Travel("name 2", "Place Two", "assets/image/2.jpg"),
      Travel("name 3", "Place Three", "assets/image/3.jpg"),
      Travel("name 4", "Place Four", "assets/image/4.jpg"),
      // Travel("name 5", "Place Five", "assets/image/5.jpg"),
      // Travel("name 6", "Place Six", "assets/image/6.jpg"),
      // Travel("name 7", "Place Seven", "assets/image/7.jpg"),
      // Travel("name 8", "Place Eight", "assets/image/8.jpg"),
    ];
  }

  static List<Travel> generateMostPopular(){
    return [
      Travel("name 1", "Place One", "assets/image/5.jpg"),
      Travel("name 2", "Place Two", "assets/image/6.jpg"),
      Travel("name 3", "Place Three", "assets/image/7.jpg"),
      Travel("name 4", "Place Four", "assets/image/8.jpg"),
    ];
  }
}