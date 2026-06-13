import 'package:flutter/material.dart';

class Dartbasic extends StatelessWidget {

  String s = "nguyenuzuu";
  String s1 = "vipp";

  var s2 = "uzuu"; // khong ghi ro kieu, dart cpl tu doan
  int  x = 18;
  List<int> numbers = [1, 2,3 , 4];


  @override
  Widget build(BuildContext context) {
    var s3 = s + s1; int y = x * 2;

    // gioosng binh htuong
    // for(int i = 0; i < numbers.length ; i++) {
    //   print(numbers[i]);
    // }

    //for each
    // numbers.forEach((numbers){
    //   print(numbers);
    // });

    // MAPPP
    // List<String> numberString = numbers.map((number){
    //   return 'value = $number';
    // }).toList();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Text("heleee: $s $s1 $s2 $s3 $x $y $numbers",
        style: TextStyle(fontSize: 23),
        textDirection: TextDirection.ltr, // left to right
        ), // text
      ), //center
    );
  }
}
