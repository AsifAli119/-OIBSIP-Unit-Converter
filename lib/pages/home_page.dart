import 'package:flutter/material.dart';
import 'conversion_body.dart';
import 'conversion_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _startMeasure;
  String? _convertedMeasure;
  double? _numberForm;
  String? _resultMessage;

  final TextStyle inputStyle = TextStyle(
    fontSize: 18,
    color: Colors.black87,
  );
  final TextStyle labelStyle = TextStyle(
    fontSize: 20,
    color: Colors.black87,
  );

  void initState() {
    _numberForm = 0;
    super.initState();
  }

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF212936);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        backgroundColor: mainColor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Unit Converter'),
          leading: Icon(Icons.line_weight_rounded),
        ),
        body: ConversionBody(
          inputStyle: inputStyle,
          labelStyle: labelStyle,
          measures: _measures,
          startMeasure: _startMeasure,
          convertedMeasure: _convertedMeasure,
          numberForm: _numberForm,
          resultMessage: _resultMessage,
          onValueChanged: (value) {
            var rv = double.tryParse(value);
            if (rv != null) {
              setState(() {
                _numberForm = rv;
              });
            }
          },
          onInitialMeasureChanged: (value) {
            setState(() {
              _startMeasure = value;
            });
          },
          onConvertedMeasureChanged: (value) {
            setState(() {
              _convertedMeasure = value;
            });
          },
          onConvertPressed: () {
            if (_startMeasure == null ||
                _convertedMeasure == null ||
                _numberForm == 0) {
              return;
            } else {
              _resultMessage = ConversionLogic().convert(
                _numberForm!,
                _startMeasure!,
                _convertedMeasure!,
              );
              setState(() {
                _resultMessage = _resultMessage;
              });
            }
          },
        ),
      ),
    );
  }
}
