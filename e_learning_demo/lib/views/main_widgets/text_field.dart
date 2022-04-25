import 'package:e_learning_demo/app_style/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  IconData icon;
  String label;
  bool isSecured;
  Function(String ?v)? onChanged;
 String? Function(String? v)? vfun;

  TextEditingController controller;

  CustomTextField(
      {required this.icon,
      required this.controller,
      required this.isSecured,
      required this.label,
      required this.onChanged,
       this.vfun});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultsize!),
      child: TextFormField(
          controller: widget.controller,
          validator: widget.vfun,
          onChanged: widget.onChanged,
          obscureText: widget.isSecured,
          decoration: InputDecoration(
            label: Text(widget.label),
            labelStyle: TextStyle(color: Colors.blue.shade300),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue, width: SizeConfig.defaultsize! * 0.3)),
            prefixIcon: Icon(
              widget.icon,
              color: Colors.blue,
            ),
            suffixIcon: widget.label == "Password"
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: widget.isSecured ? Colors.grey : Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.isSecured = !widget.isSecured;
                      });
                      print(widget.isSecured);
                    },
                  )
                : const SizedBox(
                    width: 1,
                  ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue, width: SizeConfig.defaultsize! * 0.2)),
          )),
    );
  }
}
