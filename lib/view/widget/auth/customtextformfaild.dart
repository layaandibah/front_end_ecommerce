import 'package:ecommers/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormFaild extends StatelessWidget {
  String titletext;
  String hinttext;
  Icon suffixicon;
  final String? Function(String?)? validator;
  TextEditingController textEditingController;
  final TextInputType? keyboardType;
  CustomTextFormFaild(
      {Key? key,
      required this.titletext,
      required this.hinttext,
      required this.suffixicon,
      required this.textEditingController,
      required this.validator,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: textEditingController,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 11),
          label: Container(
            margin: const EdgeInsets.only(left: 12),
            child: Text(
              titletext,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 19),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                const BorderSide(color: AppColor.primarycolor, width: 1),
          ),
        ),
      ),
    );
  }
}
