import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({
    Key? key,
  }) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('asasas'),
      ),
      body: _getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _getBody() {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/sample.jpg"), fit: BoxFit.fitWidth)),
        // color: Color.fromARGB(50, 200, 50, 20),
        child: Column(
          children: <Widget>[TextField()],
        ),
      ),
      Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 0,
        right: 0,
        child: Container(
          height: 50,
          child: Text("Hiiiii"),
          decoration: BoxDecoration(color: Colors.pink),
        ),
      ),
    ]);
  }
}
