import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blueAccent,
        padding: EdgeInsets.symmetric(vertical: 90, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'BOOK APP',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'roboto',
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 5
                  ),
                ),
                SizedBox(width: 10, height: 10),
                Text(
                  'Developed by AntoGeming',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'roboto',
                    fontSize: 18
                  ),
                )
              ],
            ),
            Image(
              image: AssetImage('images/checkmark.png'),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text(
                      'My Books',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    onPressed: () => Navigator.pushReplacementNamed(context, '/todo'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(20),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)
                      )
                    )
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}