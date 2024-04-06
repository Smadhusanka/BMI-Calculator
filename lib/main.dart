import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator', 
      debugShowCheckedModeBanner: false,
      home: myClass(),
    );
  }
}

class myClass extends StatefulWidget {
  const myClass({super.key});

  @override
  State<myClass> createState() => _myClassState();
}

class _myClassState extends State<myClass> {

  final  _weight = TextEditingController();
  final  _height = TextEditingController();
  String _bmivalue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(15)),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text('BMI',style: TextStyle(color: Colors.black, fontSize: 20),),
                Padding(padding: EdgeInsets.all(75)),
                Text('$_bmivalue',style: TextStyle(color: Colors.black, fontSize: 50),),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text('Weight(KG)',style: TextStyle(color: Colors.black, fontSize: 20),),
                Spacer(
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    controller: _weight,
                    decoration: InputDecoration(
                    hintText: 'weight',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(15)),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text('Height(cm)',style: TextStyle(color: Colors.black, fontSize: 20),),
                Spacer(
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    controller: _height,
                    decoration: InputDecoration(
                    hintText: 'Height',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
             Padding(padding: EdgeInsets.all(15)),
             MaterialButton(
              onPressed: () {
                setState(() {
                  double doubleweight = double.tryParse(_weight.text) ?? 0;
                  double doubleheight = double.tryParse(_height.text) ?? 0;
                  double realheight = ((doubleheight/100)*(doubleheight/100));
                  double realbmi = (doubleweight/realheight);
                  String reducelength = realbmi.toStringAsFixed(3);

                  _bmivalue = '$reducelength';
                });
              },
              color: Colors.black,
              child: Text('claculate', style: TextStyle(color: Colors.white, fontSize: 20),),
             ),
          ],
        ),
      ),
    );
  }
}

