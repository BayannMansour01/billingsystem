import 'package:flutter/material.dart';

Widget defaultextformfield({
  required TextEditingController controlle,
  required TextInputType type,
  required IconData prefixIcon,
  required String label,
  Function? onSubmit,
  Function? onChange,
  String? Function(String?)? validate,
  bool obscureText = false,
  IconData? suffixIcon,
  bool ispassword = false,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controlle,
      keyboardType: type,
      obscureText: ispassword,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onFieldSubmitted: (s) {
        return onSubmit!(s);
      },
      validator: (s) {
        return validate!(s);
      },
    );

Widget defaultButton({
  double width = double.infinity,
  double height = 50,
  double raduis = 24,
  Color background = Colors.green,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(text, style: TextStyle(fontSize: 20)
            //style: TextStyle(color: Colors.white),
            ),
      ),
    );
