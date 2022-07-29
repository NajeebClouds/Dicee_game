import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDecNumber = 3;
  int rightDecNumber = 3;

  int? counter;
  var randVar = Random();

  void changeFaceOfDicee_Random() {
    leftDecNumber = randVar.nextInt(6) + 1;
    rightDecNumber = randVar.nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Image.asset('images/dice$leftDecNumber.png'),
                    onPressed: () {
                      // counter++;
                      setState(() {
                        leftDecNumber = randVar.nextInt(6) + 1;
                        print('Left Button Clicked: $leftDecNumber');
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Image.asset('images/dice$rightDecNumber.png'),
                    onPressed: () {
                      // counter++;
                      setState(() {
                        rightDecNumber = randVar.nextInt(6) + 1;
                        print('Right Button Clicked: $rightDecNumber');
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          // styleFrom(textStyle: const TextStyle(fontSize: 20));
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5);
                    return null; // Use the component's default.
                  },
                ),
              ),
              onPressed: () {
                setState(() {
                  changeFaceOfDicee_Random();
                });
              },
              icon: Icon(Icons.autorenew),
              label: Text('Role the Dicee'),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '${leftDecNumber + rightDecNumber}',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ],
      ),
    );
  }
}


// class DicePage extends StatelessWidget {
 
// }
