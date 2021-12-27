


import 'package:flutter/material.dart';
import 'package:flutterapiconsume/model/book.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem(this.book,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('${book.imgUrl}');
    return Container(
      height: book.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(book.imgUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
