import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String texto;
  final Stream<String> stream;
  final Function(String) onChanged;

  InputField(
    {
      this.texto,
      this.onChanged,
      this.stream,
    }
  );
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: this.stream,
      builder: (context, snapshot) {
        return new TextField(
          onChanged: this.onChanged,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: this.texto,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            errorText: snapshot.hasError ? snapshot.error : null,
          ),
          style: const TextStyle(color: Colors.blue, fontSize: 20),
          textAlign: TextAlign.center,
        );
      }
    );
  }
}