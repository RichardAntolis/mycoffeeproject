import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    final checkoutList = Container(
      padding: EdgeInsets.all(3),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(3),
              child: Row(
                children: [
                  Row(
                    children: [
                      Card(
                        child: Image.asset(
                          'assets/images/cappucino.png',
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(15),
                      ),
                      Column(
                        children: [
                          Text("Cappucino"),
                          Align(
                            child: Text("Coffee"),
                            alignment: Alignment.topRight,
                          ),
                          Text("Rp.25000"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 210, 205),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(Icons.remove),
                    onTap: () {},
                  ),
                  Text("0"),
                  GestureDetector(
                    child: Icon(Icons.add),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final dTotal = Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    "Delivery Charges :    ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Rp. 20000 ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Taxes :     ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Rp. 20000 ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Total :     ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Rp. 40000 ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ));

    final payNow = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      color: Colors.brown,
      child: MaterialButton(
        height: 20.0, 
        minWidth: 300.0, 
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {},
        child: Text(
          "Pay Now",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color(0xffEBDBCC),
      body: ListView(
        children: [
          checkoutList,
          checkoutList,
          checkoutList,
          dTotal,
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                payNow
              ],
            ), 
            
          )
          
        ],
      ),
    );
  }
}
