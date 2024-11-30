import 'package:flutter/material.dart';

abstract class MainWidget extends StatefulWidget {
  Color color = Colors.green;
  List<Widget> children;
  void Function()? onTap;

  MainWidget({super.key, this.color = Colors.green, required this.children});

  MainWidget.child(
      {super.key,
      this.color = Colors.green,
      required this.children,
      this.onTap});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color,
        ),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    ));
  }
}

class GenderWidget extends MainWidget {
  bool isMale;

  GenderWidget(
      {super.key,
      required,
      required super.color,
      required this.isMale,
      required super.onTap})
      : super.child(
          children: [
            Text(
              isMale ? 'Male' : 'Female',
              style: const TextStyle(fontSize: 25),
            ),
            Icon(
              isMale ? Icons.male_rounded : Icons.female_rounded,
              size: 60,
            ),
          ],
        );
}

int height = 170;

class TallWidget extends MainWidget {
  final void Function(double)? onChange;
  TallWidget({super.key, required this.onChange})
      : super(color: Colors.black54, children: [
          Text(
            'Height',
            style: const TextStyle(fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'cm',
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Slider(
            activeColor: Colors.pink,
            inactiveColor: Colors.white,
            value: height.toDouble(),
            min: 120,
            max: 220,
            onChanged: onChange,
          ),
        ]);
}

class SliderWidget extends StatefulWidget {
  SliderWidget({super.key});
  int? height = 170;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return TallWidget(
      onChange: (val) => setState(() {
        widget.height = val.toInt();
        height = val.toInt();
      }),
    );
  }
}

class Counter extends MainWidget {
  int counter;
  final String unit;
  final String title;
  final onAdd;
  final onRemove;
  Counter(
      {super.key,
      required this.unit,
      required this.title,
      required this.onAdd,
      required this.onRemove,
      required this.counter})
      : super(color: Colors.black54, children: [
          Text(
            title,
            style: const TextStyle(fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                counter.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                unit,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                  onPressed: onRemove,
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white),
                  icon: Icon(Icons.remove)),
              IconButton.filled(
                  onPressed: onAdd,
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white),
                  icon: Icon(Icons.add)),
            ],
          )
        ]);
}

class CounterWidget extends StatefulWidget {
  CounterWidget(
      {super.key,
      required this.counter,
      required this.unit,
      required this.title});
  int counter;
  String unit;
  String title;

  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Counter(
        unit: widget.unit,
        title: widget.title,
        counter: widget.counter,
        onAdd: () => setState(() {
              widget.counter++;
//  weight++;
              print("+");
            }),
        onRemove: () => setState(() {
              widget.counter--;
//  weight--;
            }));
  }
}
