import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String labeltext;
  final Icon prefixIcon;
  final TextInputAction textInputAction;
  final bool isPass;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.labeltext,
    required this.prefixIcon,
    required this.textInputAction,
    this.isPass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final inputBorder = OutlineInputBorder(
    //     // borderSide: Divider.createBorderSide(context)
    //     );
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(labeltext),
        border: const OutlineInputBorder(),
        // focusedBorder: inputBorder,
        // enabledBorder: inputBorder,
        // filled: true,
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: prefixIcon,
      ),
      textInputAction: textInputAction,
      obscureText: isPass,
    );
  }
}
