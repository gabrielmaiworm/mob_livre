import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlueSlider extends StatefulWidget {
  final int kit;

  BlueSlider({required this.kit});

  @override
  _BlueSliderState createState() => _BlueSliderState();
}

class _BlueSliderState extends State<BlueSlider> {
  double _value = 0.0;
  double _taxa = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchTaxa();
  }

  Future<void> _fetchTaxa() async {
    final response = await http.get('http://177.70.102.109:3005/taxa-kit/${widget.kit}' as Uri);
    final data = jsonDecode(response.body);
    setState(() {
      _taxa = data['taxa'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Valor em minutos: ${(_value / _taxa).toStringAsFixed(2)}'),
        Slider(
          value: _value,
          min: 0.0,
          max: 100.0,
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
          activeColor: Colors.blue,
        ),
      ],
    );
  }
}