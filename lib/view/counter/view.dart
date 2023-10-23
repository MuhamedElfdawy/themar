import 'package:flutter/material.dart';
import 'package:themar/main.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int count = prefs.getInt('count')??0 ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  count++ ;
                  prefs.setInt('count', count);
                  setState(() {});
                },
                child: Icon(Icons.add),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '$count',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  count-- ;
                  setState(() {});},
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
