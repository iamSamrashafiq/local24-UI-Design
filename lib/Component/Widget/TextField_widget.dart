import 'package:flutter/material.dart';
import 'package:local24/Constant/App_Constant.dart';


class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String obscureCharacter;
  final bool isEnable, isObscure;
  final TextInputType inputType;
  final TextEditingController controller;
  final FocusNode node;
  final Function validator, onFieldSubmit, onChange;
  final TextInputAction inputAction;
  final bool readOnly;
  final Widget suffixWidget, prefixWidget;
  final Function() onTap;
  final VoidCallback onPressedLeadingIcon;
  final String labelText;
  final double padding;
  final int maxLines;
  final String initialValue;
  final Color cursorColor;
  final IconData prefixIcon;
  final IconData suffixIcon;

  CustomTextFormField(
      {this.validator,
        this.initialValue,
        this.cursorColor,
        this.inputAction,
        this.isEnable = true,
        this.isObscure = false,
        this.obscureCharacter,
        this.onFieldSubmit,
        this.prefixWidget,
        this.hintText,
        this.inputType,
        this.controller,
        this.node,
        this.onChange,
        this.onTap,
        this.suffixWidget,
        this.readOnly = false,
        this.onPressedLeadingIcon,
        this.labelText,
        this.suffixIcon,
        this.prefixIcon,
        this.maxLines = 1,
        this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(fontSize: 16.0, color: Colors.black),
          cursorColor: cursorColor ?? Colors.black,
          onTap: onTap,
          autofocus: false,
          enabled: isEnable,
          obscureText: isObscure,
          obscuringCharacter: obscureCharacter??".",
          focusNode: node,
          onFieldSubmitted: onFieldSubmit,
          initialValue: initialValue,
          controller: controller,
          textInputAction: inputAction,
          keyboardType: inputType,
          maxLines: maxLines,
          readOnly: readOnly,
          decoration: InputDecoration(
            fillColor: Colors.white,
            suffixIcon: suffixWidget ?? null,
            suffixIconColor: Colors.amber??null,
            hintText: hintText,
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black54, fontSize: 15.0,fontFamily: poppinsRegular),
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15.0,fontFamily: poppinsRegular),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            errorStyle: TextStyle(color: Colors.black54, height: 1.1),
            errorMaxLines: 3,
            // contentPadding: EdgeInsets.only(left: 10.0, top: padding),
            // fillColor: Colors.white,
            filled: true,
          ),
          validator: validator,
          onChanged: onChange,
          onSaved: (String val) {
            controller.text = val;
          },
        ),

        // suffixWidget != null
        //     ? Align(alignment: Alignment.centerRight, child: suffixWidget)
        //     : SizedBox()
      ],
    );
  }
}

