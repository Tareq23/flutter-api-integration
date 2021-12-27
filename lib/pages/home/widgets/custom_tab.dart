
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {

  final int selected;
  final Function callback;

  CustomTab(this.selected,this.callback,{Key? key}) : super(key: key);

  final tabs = ['E-Books', 'Audio-Books'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
          // controller: ScrollContext().,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                 callback(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index == selected ? Colors.white : Colors.grey[200],
                ),
                alignment: Alignment.center,
                width: (width - 20)/2-5,
                child: Text(tabs[index],
                  style: TextStyle(
                      color: index == selected ? Colors.deepOrange : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, index) => const SizedBox(width: 10,),
          itemCount: tabs.length,
      ),
    );
  }
}
