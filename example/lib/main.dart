import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:mock_data/mock_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bulleted List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> names =
        List.generate(5, (index) => '${mockName()}: ${mockLocation()}');
    final List<Widget> widgets = List.generate(
      5,
      (index) => Container(
        width: 200,
        height: 100,
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Url: ${mockUrl()}'),
              Text('ID: ${mockUUID()}'),
              Text('Date:${mockDate()}'),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Bulleted List Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1400,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BulletedList(
                listItems: names,
                listOrder: ListOrder.ordered,
              ),
              BulletedList(
                listItems:names,
                listOrder: ListOrder.ordered,
                bulletType: BulletType.numbered,
              ),
              BulletedList(
                listItems: widgets,
                bullet: Icon(Icons.star),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
