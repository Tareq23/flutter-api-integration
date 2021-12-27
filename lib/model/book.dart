
class Book
{
  String type;
  String name;
  String publisher;
  DateTime date;
  String imgUrl;
  num score;
  num rating;
  num height;
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

    ];
  }

}