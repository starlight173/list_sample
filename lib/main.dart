import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new InfiniteListViewState();
  }
}

class InfiniteListViewState extends State<InfiniteListView> {
  var items = new List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Container(
        child: new ListView.builder(
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            final widgetItem = (index == items.length)
                ? new RaisedButton(
                    child: new Text("Load more..."),
                    onPressed: () {
                      var nextItems = new List<String>.generate(20, (i){
                        var itemId = i + items.length;
                        return "Item $itemId";
                      });

                      /// Update
                      setState(() {
                        items.addAll(nextItems);
                      });
                    },
                    color: Colors.greenAccent,
                    splashColor: Colors.red,
                    elevation: 4.0,
                  )
                : new ListTile(
                    title: new Text('${items[index]}'),
                  );
            return widgetItem;
          },
        ),
      ),
    );
  }
}
