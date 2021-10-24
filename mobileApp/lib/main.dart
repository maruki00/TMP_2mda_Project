import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: home(),
    )
  );
}

class home extends StatelessWidget{
  late int _index=0;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeeksforGeeks'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 100,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.search),backgroundColor: Colors.amber, label: "search"),
           BottomNavigationBarItem(icon: Icon(Icons.search),backgroundColor: Colors.red, label: "search"),
           BottomNavigationBarItem(icon: Icon(Icons.search),backgroundColor: Colors.red, label: "search"),
           BottomNavigationBarItem(icon: Icon(Icons.search),backgroundColor: Colors.red, label: "search"),
           BottomNavigationBarItem(icon: Icon(Icons.search),backgroundColor: Colors.red, label: "search"),
           BottomNavigationBarItem(icon: Icon(Icons.search),backgroundColor: Colors.red, label: "search"),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.red.shade500,
        onTap: (int index) =>_index=index,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("hello world"),
        ),
    );
  }
}