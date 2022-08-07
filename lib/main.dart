//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const ZescoResidentialCalculator());
}

class ZescoResidentialCalculator extends StatelessWidget {
  const ZescoResidentialCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset:false,
        appBar: AppBar(
          title: const Text("ZESCO RESIDENTIAL CALCULATOR"),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.all(10), children: [
            const DrawerHeader(
              decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/lightbulb.jpg"),
              fit: BoxFit.cover),
                color: Colors.blue,

              ),
              child: Text('',),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.language_outlined),
              title: const Text('Author'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Share'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const Divider(),
            const Text("Other", style: TextStyle(fontSize:14,fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('feedback'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),

          ]),
        ),
        body: ZescoResidentialCalculatorMainBody(),
      ),
    );
  }
}

//Making a Stateful widget for the main body
class ZescoResidentialCalculatorMainBody extends StatefulWidget {
   ZescoResidentialCalculatorMainBody({Key? key}) : super(key: key);



  @override
  State<ZescoResidentialCalculatorMainBody> createState() => _ZescoResidentialCalculatorMainBodyState();
}

class _ZescoResidentialCalculatorMainBodyState extends State<ZescoResidentialCalculatorMainBody> {


  final TextEditingController amount = new TextEditingController();
  final TextEditingController units = new TextEditingController();
  final TextEditingController vat = new TextEditingController();
  final TextEditingController customs = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    const title = "KWACHA TO UNITS CONVERSION";
    return Container(
    constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("images/geometric.png"), fit: BoxFit.cover)),
      child: Center(
        child:Expanded(
        child: Column(
          children:  <Widget>[



    const Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.white),

    )


    ),

            const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Image(image: AssetImage("images/zesco.jpg"),width: 100,height: 50,),

                ),
            Padding(
              padding: EdgeInsets.all(15),
    child: TextField(
controller: amount,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter amount (ZMW)',
    hintStyle: TextStyle(color: Colors.white),
    prefixIcon: Icon(Icons.money_sharp)  
    ),
    keyboardType: TextInputType.number,

    style: TextStyle(color: Colors.white),)),
      Padding(

          padding: EdgeInsets.only(top: 5.0),

        child: ElevatedButton(
          onPressed:(){
            setState(() {
              double units_results = double.parse(amount.text);
              units.text = units_results.toString() +" kWh";
            });
          },
          child: Text('1st Purchase')
      ),
      ),
      Padding(
          padding: EdgeInsets.only(top: 5),child: ElevatedButton(
          onPressed:(){},
          child: Text('2nd Purchase')
      ),
      ),
            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 30),child: ElevatedButton(
                onPressed:(){},
                child: Text('3rd Purchase')
            ),
            ),
      Expanded(child: Text('RESULTS',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
      Expanded(child: TextField(
        readOnly:true,
        controller: units,
          decoration: InputDecoration(
             hintText: 'UNITS (kWh)',
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.ad_units)
          ),style: TextStyle(color: Colors.white),)),

            Expanded(child: TextField(
                readOnly:true,
              controller: vat,
                decoration: InputDecoration(
                    hintText: 'VAT DEDUCTED (ZMW)',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.monetization_on)
                ),style: TextStyle(color: Colors.white),)),
            Expanded(child: TextField(
                readOnly:true,
              controller: customs,
                decoration: InputDecoration(
                    hintText: 'CUSTOM DEDUCTED (ZMW)',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.money_sharp)
                ),style: TextStyle(color: Colors.white),)),
      ],


        ),

      ),
      
    ));
  }
}

