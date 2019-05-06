import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeScreenState();
  }
}

class Bitcoin {
  String name = "", percent_change_1h = "";
  Bitcoin._({this.name, this.percent_change_1h});
  factory Bitcoin.json(Map<String, dynamic> json) {
    return new Bitcoin._(
      name: json['name'],
      percent_change_1h: json['percent_change_1h'],
    );
  }
}

class Contact {
  String name = "", mobile_number = "";
  Contact(this.name, this.mobile_number);
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Bitcoin> _bitcoin = List();
  List<Contact> _contactList = [
    new Contact("Anil Thummer", "7600162501"),
    new Contact("Avani patel", "8585858585"),
    new Contact("Bhoomika ", "8585858585"),
    new Contact("Umar ", "8585858585"),
    new Contact("Pur patel", "8585858585"),
    new Contact("ramesh patel", "8585858585"),
    new Contact("suresh patel", "8585858585"),
    new Contact("mahesh patel", "8585858585"),
    new Contact("poli patel", "8585858585")
  ];
  _fetchData() async {
    String strUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=5";
    final response = await http.get(strUrl);
    _bitcoin = (json.decode(response.body) as List)
        .map((data) => new Bitcoin.json(data))
        .toList();
  }

  String currentProfilePic =
      "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg";
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 4, vsync: this, initialIndex: 0);
//    Contact _contact1 = new Contact("Anil Thummer", "7600162501");
//    Contact _contact2 = new Contact("Avani patel", "8585858585");
//    Contact _contact3 = new Contact("Bhoomika ", "8585858585");
//    Contact _contact4 = new Contact("Umar ", "8585858585");
//    Contact _contact5 = new Contact("Pur patel", "8585858585");
//    Contact _contact6 = new Contact("ramesh patel", "8585858585");
//    Contact _contact7 = new Contact("suresh patel", "8585858585");
//    Contact _contact8 = new Contact("mahesh patel", "8585858585");
//    Contact _contact9 = new Contact("poli patel", "8585858585");
//    _contactList.add(_contact1);
//    _contactList.add(_contact2);
//    _contactList.add(_contact3);
//    _contactList.add(_contact4);
//    _contactList.add(_contact5);
//    _contactList.add(_contact6);
//    _contactList.add(_contact7);
//    _contactList.add(_contact8);
//    _contactList.add(_contact9);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.teal,
          brightness: Brightness.light,
          primaryColor: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          bottom: TabBar(controller: _controller, tabs: [
            new Tab(child: Icon(Icons.chat)),
            new Tab(child: Icon(Icons.camera)),
            new Tab(child: Icon(Icons.home)),
            new Tab(child: Icon(Icons.contacts)),
          ]),
          actions: <Widget>[
            Builder(builder: (BuildContext context) {
              return IconButton(
                  icon: Icon(Icons.drive_eta),
                  onPressed: () => {
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text('HGhffgf'),
                          duration: Duration(seconds: 5),
                        ))
                      });
            })
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text("Contacts")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera), title: Text("Camera"))
        ]),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text('Bram Vanbilsen'),
                accountEmail: Text('brambilsen@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: CircleAvatar(
                    child: Text("B"),
                  ),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: NetworkImage(currentProfilePic),
                        fit: BoxFit.fill)),
              ),
              new ListTile(
                  leading: CircleAvatar(
                    child: Text("o"),
                  ),
                  title: new Text("Page One"),
                  trailing: new Icon(Icons.arrow_upward),
                  onTap: () {
                    Navigator.of(context).pop();
//                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
                  }),
              new ListTile(
                  leading: CircleAvatar(
                    child: Text("t"),
                  ),
                  title: new Text("Page Two"),
                  trailing: new Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
//                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Second Page")));
                  }),
            ],
          ),
        ),
        body: TabBarView(controller: _controller, children: [
          new ListView.builder(
              itemCount: _contactList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(_contactList[index].name[0]),
                  ),
                  title: Text(_contactList[index].name),
                  subtitle: Text(_contactList[index].mobile_number),
                  trailing: Icon(Icons.contacts),
                );
              }),
          AlertDialog(
            title: Text(
              "alertdialog",
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
            child: Center(child: Text("Contaier")),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Center(child: Text("Contaier")),
          )
        ]),
      ),
    );
  }
}
