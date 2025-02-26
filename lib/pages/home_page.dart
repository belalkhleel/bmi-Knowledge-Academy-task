import 'package:bmi/pages/result_page.dart';
import 'package:bmi/widgets/main_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SliderWidget sliderWidget = SliderWidget();
  CounterWidget WeightCounterWidget = CounterWidget(
    counter: 70,
    unit: "kg",
    title: "Weight",
  );
  CounterWidget tallCounterWidget = CounterWidget(
    counter: 20,
    unit: "year",
    title: "Age",
  );
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GenderWidget(
                    isMale: true,
                    color: isMale ? Colors.pink : Colors.black38,
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                      print("Male");
                    },
                  ),
                  GenderWidget(
                    isMale: false,
                    color: isMale ? Colors.black38 : Colors.pink,
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                      print("Female");
                    },
                  ),
                ],
              ),
            ),
            sliderWidget,
            Expanded(
              child: Row(
                children: [WeightCounterWidget, tallCounterWidget],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                double height = sliderWidget.height! / 100;
                double bmi = WeightCounterWidget.counter / (height * height);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultPage(bmi: bmi),
                ));
                print("height is : ${sliderWidget.height}");
                print("height is : ${WeightCounterWidget.counter}");
                print("height is : ${tallCounterWidget.counter}");
                print("height is : ${bmi}");
              },
              child: const Text('Calculate'),
            ),
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
