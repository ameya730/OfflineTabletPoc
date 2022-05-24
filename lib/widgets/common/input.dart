import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscure;
  const Input({
    Key? key,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          obscureText: obscure,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.1,
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
