import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String infoText;

  void _alterarPessoas(int delta){
    setState(() {
      if ((((_pessoas != 0) || (delta > 0)) && (infoText != "Lotado!")) ||
          ((infoText == "Lotado!") && (delta < 0))) {
        _pessoas += delta;
      }
      if (_pessoas < 10){
        infoText = "Pode entrar!";
      }
      else {
        infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoas",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      onPressed: () {
                        _alterarPessoas(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      onPressed: () {
                        _alterarPessoas(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                )
              ],
            ),
            Text(
              "$infoText",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}

