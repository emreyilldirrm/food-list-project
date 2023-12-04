import 'package:flutter/material.dart';
import 'package:fooflist/Food.dart';
import 'package:fooflist/product_detail.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Food Market'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Food>>bring_the_food() async{
    var foodlist = <Food>[];

    var f1 =Food(1,12,"ayran.png","Ayran");
    var f2 =Food(2,18,"dana_salam.png","Dana Salam");
    var f3 =Food(3,25,"kahve.png","Kahve");
    var f4 =Food(4,22,"kola.png","Kola");
    var f5 =Food(5,12,"pirinc_unu.png","Pirinç Unu");

    foodlist.add(f1);
    foodlist.add(f2);
    foodlist.add(f3);
    foodlist.add(f4);
    foodlist.add(f5);

    return foodlist;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),

        backgroundColor: Colors.blue,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),
      body:FutureBuilder<List<Food>>(
      future:bring_the_food(),
      builder: (context, snapshot) {
      if(snapshot.hasData){
        var foodlist=snapshot.data;

        return ListView.builder(
        itemCount:foodlist!.length ,
        itemBuilder: (context, index) {
        var food =foodlist[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Product_Detail(food: food),));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
            children: [
                SizedBox(
                    width: 100,
                    child: Image.asset("img/"+food.img_name)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(food.name.toString(),style: TextStyle(color: Colors.blue),),
                      Text(food.price.toString()+"\u{20BA}",style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold),),


                  ],),
                ),
                Spacer(),
              Icon(
                size: 30,
                Icons.arrow_right,
              )

            ],),
              ),

            ),
          );
        },
    );
    }else{
        return Center();
    }
    },
    )
    );
  }
}
