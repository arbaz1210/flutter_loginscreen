import 'package:flutter/material.dart';
import 'package:flutter_loginscreen/screens/HomeScreen.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen();
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<Loginscreen>
    with SingleTickerProviderStateMixin {
  List _data1;
  LoginScreenState();
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    _animation.addListener(() => this.setState(() {}));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Screen demo",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: _createWidget(context, this._data1),
    );
  }
}

Widget _createWidget(BuildContext context, List _data1) {
  List _data11;
  _data11 = _data1;
  return new Stack(
    fit: StackFit.expand,
    children: <Widget>[
      new Image(
        image: new AssetImage("assets/girl.jpeg"),
        fit: BoxFit.cover,
        color: Colors.black54,
        colorBlendMode: BlendMode.darken,
      ),
      new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlutterLogo(
            size: 100,
            colors: Colors.orange,
          ),
          new Form(
              child: Theme(
            data: new ThemeData(
                primarySwatch: Colors.red,
                accentColor: Colors.teal,
                inputDecorationTheme: new InputDecorationTheme(
                    labelStyle:
                        new TextStyle(color: Colors.green, fontSize: 20.0))),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              color: Colors.white30,
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Enter Email"),
                      keyboardType: TextInputType.text,
                    ),
                    new TextFormField(
                      decoration:
                          new InputDecoration(labelText: "Enter Password"),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new MaterialButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()))
                          },
                      color: Colors.teal,
                      child: new Text("Login "),
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      minWidth: 80,
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      )
    ],
  );
}

//Widget _buildWidget() {
//  return new Stack(
//    fit: StackFit.expand,
//    children: <Widget>[
//      new Image(
//        image: new AssetImage("assets/girl.jpeg"),
//        fit: BoxFit.cover,
//        color: Colors.black87,
//        colorBlendMode: BlendMode.darken,
//      ),
//      new Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new FlutterLogo(
//            size: 100,
//          ),
//          new Form(
//              child: Theme(
//                  data: ThemeData(
//                      primaryColor: Colors.red,
//                      brightness: Brightness.dark,
//                      accentColor: Colors.teal,
//                      inputDecorationTheme: InputDecorationTheme(
//                          labelStyle:
//                              TextStyle(color: Colors.green, fontSize: 20.0))),
//                  child: Container(
//                    padding: EdgeInsets.all(40.0),
//                    child: Column(
//                      children: <Widget>[
//                        new TextFormField(
//                          style: TextStyle(),
//                          decoration: InputDecoration(labelText: "Enter Email"),
//                          keyboardType: TextInputType.text,
//                        ),
//                        new TextFormField(
//                          style: TextStyle(),
//                          decoration:
//                              InputDecoration(labelText: "Enter Password"),
//                          keyboardType: TextInputType.number,
//                        ),
//                        new Padding(padding: EdgeInsets.only(top: 30.0)),
//                        new MaterialButton(
//                          onPressed: null,
//                          child: Text("Login"),
//                          textColor: Colors.white,
//                          splashColor: Colors.red,
//                          minWidth: 80,
//                          height: 40,
//                          color: Colors.teal,
//                        )
//                      ],
//                    ),
//                  )))
//        ],
//      )
//    ],
//  );
//}
