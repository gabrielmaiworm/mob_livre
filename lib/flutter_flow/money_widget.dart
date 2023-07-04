import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyWidget extends StatefulWidget {
  @override
  _MoneyWidgetState createState() => _MoneyWidgetState();
}

class _MoneyWidgetState extends State<MoneyWidget> {
  final TextEditingController _controller = TextEditingController();
  final formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  String valorFormatado = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        if (_controller.text.isNotEmpty) {
          final valor = double.parse(_controller.text);
          valorFormatado = formatador.format(valor);
        } else {
          valorFormatado = '';
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Valor',
      ),
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      onChanged: (value) {
        // Atualiza o valor no TextEditingController
        _controller.value = _controller.value.copyWith(
          text: value,
          selection: TextSelection.fromPosition(
            TextPosition(offset: value.length),
          ),
        );
      },
      textAlign: TextAlign.right,
    );
  }
}
