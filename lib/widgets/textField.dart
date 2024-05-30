import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({required this.label, required this.controller,this.maxLines,this.isNumber,this.isAutoValidate, this.isMultiline, this.isEmail, super.key});

  final String label;
  final TextEditingController controller;
  final int? maxLines;
  final bool? isNumber;
  final bool? isAutoValidate;
  final bool? isMultiline;
  final bool? isEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     // autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value){
        if(isEmail==true){
          bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if (emailValid != true) {
            return 'Email Format not matched';
          }
        }
        if(value == null||value.isEmpty){
          return 'This Field Cant be Empty';
        }
        return null;
      },
      style: MyTextStyle.projectDetailStyle,
      controller: controller,
      maxLines: maxLines??1,
      keyboardType: isNumber==true?TextInputType.number:isMultiline==true?TextInputType.multiline:TextInputType.text,
      inputFormatters: isNumber==true?[
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
      ]:[],
      cursorColor: MyColors.primaryColor,
      decoration: InputDecoration(
        focusColor: MyColors.primaryColor,
          hoverColor: MyColors.primaryColor,
          labelText: label,
          labelStyle: MyTextStyle.projectDetailStyle,
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}