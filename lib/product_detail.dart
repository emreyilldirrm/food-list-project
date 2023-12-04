import 'package:flutter/material.dart';

class Product_Detail extends StatefulWidget {
  var food;


  Product_Detail({required this.food});

  @override
  State< Product_Detail> createState() => _Product_DetailState();
}

class _Product_DetailState extends State< Product_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(
          centerTitle: true,
      title: Text(widget.food.name),
    )
        ,
        body:
        Center(
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                SizedBox(
                    width: 200,
                    child: Image.asset("img/"+widget.food.img_name)),
                Text(widget.food.price.toString()+"\u{20BA}",style: TextStyle(color: Colors.purpleAccent,fontSize:50),),
                    TextButton(onPressed: (){
                      print(widget.food.name+" sipariş verildi");
                    }, style: TextButton.styleFrom(backgroundColor: Colors.blue ,),child: Text("Sipariş Ver",style: TextStyle(color: Colors.white,fontSize: 30),))
                  ]),
                )
    );
  }
}
