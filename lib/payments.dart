import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment_app/main.dart';
import '/UiFake.dart' if (dart.library.html) 'dart:ui' as ui;

class Webpayment extends StatelessWidget {
  final String? name;
  //final String? image;
  final int? price;
  Webpayment({this.name, this.price});
  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory("rzp-html", (int viewId) {
      IFrameElement element = IFrameElement();
      window.onMessage.forEach((element) {
        print('Event Received in callback: ${element.data}');
        if (element.data == 'MODAL_CLOSED') {
          Navigator.pop(context);
        } else if (element.data == 'SUCCESS') {
          print('PAYMENT SUCCESSFULL!!!!!!!');
        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => Products(),));
        //  FirebaseFirestore.instance.collection('Products').doc('iphone12').update({
        //     'payment':"Done"
        //  });
      });

      element.src = 'assets/payments.html?name=$name&price=$price';
      element.style.border = 'none';

      return element;
    });
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return const HtmlElementView(viewType: 'rzp-html');
    }));
  }
}
