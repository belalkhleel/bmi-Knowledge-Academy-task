import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;

  const ResultPage({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Result',
            style: TextStyle(fontSize: 25),
          ),
          bmi < 18.5
              ? const Text(
                  'Under Weight',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                )
              : bmi < 25
                  ? const Text(
                      'Normal Weight',
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    )
                  : const Text(
                      'Over Weight',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
          Text(
            bmi.toStringAsFixed(2),
            style: const TextStyle(fontSize: 25),
          ),
        ],
      )),
    );
  }
}
