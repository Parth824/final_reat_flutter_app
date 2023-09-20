import 'package:flutter/material.dart';


class TotalAmountPage extends StatefulWidget {
  const TotalAmountPage({super.key});

  @override
  State<TotalAmountPage> createState() => _TotalAmountPageState();
}

class _TotalAmountPageState extends State<TotalAmountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Totale Price"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [

            ],
          ),
        ],
      ),
    );
  }
}