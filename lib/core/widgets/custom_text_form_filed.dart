import 'package:flutter/material.dart';




class CustomTextFormFiled extends StatelessWidget {

  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly ;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  const CustomTextFormFiled({super.key, this.controller, required this.hintText, this.maxLines, this.suffixIcon,
  this.readOnly=false, this.onTap, this.validator

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly:readOnly ,
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      onTapOutside: (v){
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.indigo
            )
        ),
      ),
    );
  }
}
