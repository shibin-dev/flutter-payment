import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'lightcolors.dart';
import 'payments.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightYellow, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razzorpay Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
                  primaryColor: LightColors.kDarkYellow
              ),
      home: Products(),
    );
  }
}
class Products extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children:[
              const SelectableText("My Payment",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 40)),
              const SizedBox(height:20),
              // StreamBuilder<QuerySnapshot>(
              //   stream: FirebaseFirestore.instance.collection('Products').snapshots(),
              //   builder: (context, snapshot) {
              //     if(snapshot.data == null){
              //       return Center(child:Text("Loading..."));
              //     }
              //     List<Widget> products =[];
              //     for(var i in snapshot.data!.docs){
              //       final name=i.get('name');
              //       final image =i.get('image');
              //       final price = i.get('price');
              //       final productWidget = product(name, image, price,context);
              //       products.add(productWidget);
              //     }
              //     return ListView(
              //       shrinkWrap: true,
              //       children: products,
              //     );
              //   }
              // )
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Webpayment(name: 'bat',price:400,)));
              }, child: const Text("Pay"))
            ]
          ),
        ),
    );
  }
  // ListTile product(String name,String image,var price,BuildContext context){
    
  //   return ListTile(
  //     onTap: (){
  //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Webpayment(name: name,image: image,price:price,)));
  //     },
  //     leading: Container(
  //       height: 100,width: 100,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         image: DecorationImage(image: NetworkImage('$image'))
  //       ),
  //     ),
  //       title: SelectableText("$name"),
  //       subtitle: SelectableText("Best Selller"),
  //       trailing: SelectableText("\₹ $price"),
  //   );
 // }
}

