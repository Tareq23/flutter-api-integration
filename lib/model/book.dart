
class Book
{
  String type;
  String name;
  String publisher;
  DateTime date;
  String imgUrl;
  num score;
  num rating;
  double height;
  String review;
  Book(
      this.type,
      this.name,
      this.publisher,
      this.date,
      this.imgUrl,
      this.score,
      this.rating,
      this.height,
      this.review,
      );

  static List<Book> generateBookList (){
    return [
      Book('type', 'name', 'publisher', DateTime(2021,3,12), 'assets/images/1.jpg', 12, 4.5, 330, 'review'),
      Book('type', 'name', 'publisher', DateTime(2021,3,12), 'assets/images/2.jpg', 12, 4.5, 150, 'review'),
      Book('type', 'name', 'publisher', DateTime(2021,3,12), 'assets/images/3.jpg', 12, 4.5, 130, 'review'),
      Book('type', 'name', 'publisher', DateTime(2021,3,12), 'assets/images/4.jpg', 12, 4.5, 150, 'review'),
      Book('type', 'name', 'publisher', DateTime(2021,3,12), 'assets/images/5.jpg', 12, 4.5, 330, 'review'),
      Book('type', 'name', 'publisher', DateTime(2021,3,12), 'assets/images/6.jpg', 12, 4.5, 200, 'review'),
      Book('type', 'name', 'publisher', DateTime(2021,3,12), 'assets/images/7.jpg', 12, 4.5, 130, 'review'),
      Book('type', 'name', 'publisher', DateTime(2021,3,12), 'assets/images/8.jpg', 12, 4.5, 300, 'review'),
    ];
  }

}