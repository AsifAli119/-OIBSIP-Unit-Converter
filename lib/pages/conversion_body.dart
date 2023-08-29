import 'package:flutter/material.dart';

class ConversionBody extends StatelessWidget {
  final TextStyle inputStyle;
  final TextStyle labelStyle;
  final List<String> measures;
  final String? startMeasure;
  final String? convertedMeasure;
  final double? numberForm;
  final String? resultMessage;
  final ValueChanged<String> onValueChanged;
  final ValueChanged<String> onInitialMeasureChanged;
  final ValueChanged<String> onConvertedMeasureChanged;
  final VoidCallback onConvertPressed;

  const ConversionBody({
    required this.inputStyle,
    required this.labelStyle,
    required this.measures,
    required this.startMeasure,
    required this.convertedMeasure,
    required this.numberForm,
    required this.resultMessage,
    required this.onValueChanged,
    required this.onInitialMeasureChanged,
    required this.onConvertedMeasureChanged,
    required this.onConvertPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Text(
                  resultMessage ?? '',
                  style: labelStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "Enter value to convert",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                ),
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: onValueChanged,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: DropdownButton(
                    style: inputStyle,
                    hint: Text(
                      "Unit",
                      style: inputStyle,
                    ),
                    items: measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                          style: inputStyle),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onInitialMeasureChanged(value!); // Convert String? to String
                    },
                    value: startMeasure,
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt_rounded,
                  color: Colors.white,
                  size: 35.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton(
                    hint: Text(
                      "Unit",
                      style: inputStyle,
                    ),
                    style: inputStyle,
                    items: measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: inputStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onConvertedMeasureChanged(value!); // Convert String? to String
                    },
                    value: convertedMeasure,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                child: Text('Convert', style: TextStyle(color: Colors.white, fontSize: 24)),
                onPressed: onConvertPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
