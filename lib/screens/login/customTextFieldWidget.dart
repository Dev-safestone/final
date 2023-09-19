import 'package:flutter/material.dart';

import '../../utils/consts.dart';

Widget customTextFieldWidget(
    String title,
    TextEditingController edtingController,
    Function onTextChange,
    TextInputType textInput,
    Color boxColor,
    String imagePath,
    bool isPassword,
    bool isInvalid,
    String errorText) {
  return Container(
    margin: const EdgeInsets.only(right: 20, left: 20),
    alignment: Alignment.center,
    width: textFieldWidth,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 6,
        ),
        Container(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    child: Image.asset(
                      imagePath,
                      color: Color(0xFF858585),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF858585),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isInvalid,
                child: Text(
                  errorText,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 203, 70, 60),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: textFieldHeight,
          margin: const EdgeInsets.only(left: 6, right: 6, top: 6),
          padding: const EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: boxColor,
          ),
          child: TextFormField(
            obscureText: isPassword,
            // inputFormatters: [
            //   FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),
            // ],
            //autofocus: true,
            cursorColor: primaryColor,
            style: TextStyle(color: Color.fromARGB(255, 181, 181, 181)),

            controller: edtingController,
            keyboardType: textInput,

            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              floatingLabelStyle: TextStyle(color: colorPrimary),

              focusColor: colorPrimary,
              border: InputBorder.none,
              // hintText: 'First Name',
              hintStyle: TextStyle(
                color: colorPrimary,
                fontSize: 8,
              ),
            ),
            onChanged: (value) {
              onTextChange;
            },
          ),
        ),
      ],
    ),
  );
}

Widget customMultiLineTextFieldWidget(
    String title,
    TextEditingController edtingController,
    Function onTextChange,
    TextInputType textInput,
    Color boxColor,
    bool isInvalid,
    String errorText) {
  return Container(
    alignment: Alignment.center,
    width: textFieldWidth,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 6,
        ),
        Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 12,
                  color: textFeildTitleColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Visibility(
                visible: isInvalid,
                child: Text(
                  errorText,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 203, 70, 60),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: multiLineTextFieldHeight,
          margin: const EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 6),
          padding: const EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: boxColor,
          ),
          child: TextFormField(
            maxLines: null,
            // inputFormatters: [
            //   FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),
            // ],
            //autofocus: true,
            cursorColor: colorPrimary,
            controller: edtingController,
            keyboardType: TextInputType.name,

            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              floatingLabelStyle: TextStyle(color: colorPrimary),

              focusColor: colorPrimary,
              border: InputBorder.none,
              // hintText: 'First Name',
              hintStyle: TextStyle(
                color: colorPrimary,
                fontSize: 8,
              ),
            ),
            onChanged: (value) {
              onTextChange;
            },
          ),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    ),
  );
}
