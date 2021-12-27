import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapiconsume/model/book.dart';
import 'package:flutterapiconsume/pages/home/widgets/book_item.dart';



class BookStaggeredGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final book = Book.generateBookList();
  final Function callback;
  BookStaggeredGridView(this.selected, this.pageController,this.callback,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        onPageChanged: (index) => callback,
        children: [
          StaggeredGridView.countBuilder(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisCount: 4,
              itemCount: book.length,
              itemBuilder: (context,index){

                return BookItem(book[index]);
              },
              staggeredTileBuilder: (_) => StaggeredTile.fit(2),
          ),
          Container(),
        ],
      ),
    );
  }
}




















