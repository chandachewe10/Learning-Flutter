//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';


void main() {
  runApp(const ZescoResidentialCalculator());
}

class ZescoResidentialCalculator extends StatelessWidget {
  const ZescoResidentialCalculator({Key? key}) : super(key: key);

  // Function to trigger url redirect
  _launchURLBrowser() async {
    try {
      var url = Uri.parse("https://www.github.com/chandachewe10");

      await launchUrl(url);
    }
    catch (e) {

    throw 'Could not launch'+ e.toString();

  }
  }


  // Function to trigger Mailto
  void _launchURL() async {
    String telephoneNumber = '+260961264154';
    String telephoneUrl = "tel:$telephoneNumber";
    if (await launchUrlString(telephoneUrl)) {
      await launchUrlString(telephoneUrl);
    } else {
      throw "Error occured trying to call that number.";
    }
  }




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

    child:ListView(

        padding: EdgeInsets.all(10), children: [
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
              title:
              const Text('Author'),

                    onTap:
                () {
                //print('Tapped Successfully');
                  _launchURLBrowser();
                   }
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Share'),
              onTap: () {
                final box = context.findRenderObject() as RenderBox?;
                Share.share("Hey Check this calculator I found",
                    subject: "Zesco Residential Calculator",
                    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
              },
            ),
            const Divider(),
            const Text("Other", style: TextStyle(fontSize:14,fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('feedback'),
              onTap: () {
                _launchURL();




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
  final TextEditingController after_tax = new TextEditingController();

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
              double amount_value = double.parse(amount.text);
              double vat_tax = amount_value*0.16;
              double customs_tax = amount_value*0.03;
              double totalTax = (vat_tax) + (customs_tax);
              double amountAfterTax = amount_value - totalTax;
              after_tax.text = "K"+amountAfterTax.toStringAsFixed(2);
              vat.text = "K"+(vat_tax).toStringAsFixed(2);
              customs.text = "K"+(customs_tax).toStringAsFixed(2);


              //if units <= k47, do this
              if (amountAfterTax <= 47) {
                units.text = (amount_value / 0.47).toStringAsFixed(2)+" kWh";
              } else

              if (amountAfterTax >= 48 && amountAfterTax <= 217) {
                double R1units = 100;
                units.text = (((amount_value - 55.93) / (1.2 * 0.85)) + R1units).toStringAsFixed(2)+" kWh";
              } else {
                double R1units = 100;

                double R2units = (170 / 0.85);

                double R3units = ((amount_value - 258.23) / (1.2 * 1.94));

                units.text = (R1units + R2units + R3units).toStringAsFixed(2)+" kWh";
              }



            });
          },
          child: Text('1st Purchase')
      ),
      ),
      Padding(
          padding: EdgeInsets.only(top: 5),child: ElevatedButton(
          onPressed:(){
            setState(() {
              double amount_value = double.parse(amount.text);
              double vat_tax = amount_value*0.16;
              double customs_tax = amount_value*0.03;
              double totalTax = (vat_tax) + (customs_tax);
              double amountAfterTax = amount_value - totalTax;
              after_tax.text = "K"+amountAfterTax.toStringAsFixed(2);
              vat.text = "K"+(vat_tax).toStringAsFixed(2);
              customs.text = "K"+(customs_tax).toStringAsFixed(2);

              if (amountAfterTax >= 1 && amountAfterTax <= 201) {
                units.text = ((amount_value) / (1.01)).toStringAsFixed(2)+" kWh";


              } else {
                //
                units.text = (((amount_value-203) / (2.31)) + 201).toStringAsFixed(2)+" kWh";

              }

            });
          },
          child: Text('2nd Purchase')
      ),
      ),
            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 30),child: ElevatedButton(
                onPressed:(){

                  setState(() {
                    double amount_value = double.parse(amount.text);
                    double vat_tax = amount_value*0.16;
                    double customs_tax = amount_value*0.03;
                    double totalTax = (vat_tax) + (customs_tax);
                    double amountAfterTax = amount_value - totalTax;
                    after_tax.text = "K"+amountAfterTax.toStringAsFixed(2);
                    vat.text = "k"+(vat_tax).toStringAsFixed(2);
                    customs.text = "k"+(customs_tax).toStringAsFixed(2);

                    double R3bandPerUnit = 2.31;//2.31 ngwe per unit post tax
                    units.text = (amount_value / R3bandPerUnit).toStringAsFixed(2)+" kWh";

                    
                  });


                },
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
            Expanded(child: TextField(
              readOnly:true,
              controller: after_tax,
              decoration: InputDecoration(
                  hintText: 'Amount After TAX DEDUCTIONS (ZMW)',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.money_off_csred_sharp)
              ),style: TextStyle(color: Colors.white),)),
      ],


        ),

      ),
      
    ));
  }
}

