// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks, camel_case_extensions
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ten_twenty_asgn/Utils/Constants.dart';
import 'package:ten_twenty_asgn/widgets/CustomColors.dart';

class CommonWidget {
  /*ShowMessage(int StatusCode, String Status, String StatusMessage) {
    if (StatusCode == -1) {
      Get.snackbar(Status, StatusMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2));
    } else {
      Get.snackbar(Status, StatusMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          dismissDirection: DismissDirection.down,
          colorText: Colors.white,
          duration: const Duration(seconds: 2));
    }
  }*/

  showToast(String? message, int bcolor) {
    Fluttertoast.showToast(
        msg: message ?? "",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bcolor == 1
            ? Colors.red
            : bcolor == 2
                ? Colors.orange
                : bcolor == 3
                    ? Colors.green
                    : Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Widget BuildLabel(BuildContext context, String labelName, bool required) {
    if (required) {
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              //  color: Colors.red,
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Row(
                children: [
                  Flexible(
                    child: Text(labelName,
                        maxLines: 2,
                        style: const TextStyle(
                            fontFamily: Constants.ENG_FONT,
                            fontSize: Constants.TEXTFIELD_LABEL_ENG_FS,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Text("*",
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: Constants.ENG_FONT,
                        fontSize: Constants.TEXTFIELD_LABEL_ENG_FS,
                      )),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Flexible(
        child: Text(labelName,
            maxLines: 2,
            style: const TextStyle(
                fontFamily: Constants.ENG_FONT,
                fontSize: Constants.TEXTFIELD_LABEL_ENG_FS,
                fontWeight: FontWeight.bold)),
      );
    }
  }

  Widget ScreenHeading(
      BuildContext context, String EngHeading, String UrduHeading) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            EngHeading != ""
                ? Text(
                    EngHeading,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: Constants.ENG_FONT,
                        fontSize: Constants.SCREEN_TITLE_ENG_FS),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 5,
            ),
            UrduHeading != ""
                ? Text(
                    UrduHeading,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: Constants.URDU_FONT,
                        fontSize: Constants.SCREEN_TITLE_URDU_FS),
                  )
                : const SizedBox(),
          ],
        ));
  }

  TextStyle textStyleLight() {
    return const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: Constants.ENG_FONT,
        fontWeight: FontWeight.bold);
  }

  TextStyle textStyleDark() {
    return const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontFamily: Constants.ENG_FONT,
        fontWeight: FontWeight.bold);
  }

  Widget textFieldOTP(
      {required bool first,
      required bool last,
      required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xff094F93)),
        //background color of dropdown button
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      width: MediaQuery.of(context).size.width / 8,
      child: TextField(
        controller: controller,
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: true,
        readOnly: false,
        maxLines: null,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontFamily: Constants.ENG_FONT,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          counterText: "",
          contentPadding:
              EdgeInsets.only(left: 10.0, bottom: 2.0, right: 10, top: 2.0),
        ),
      ),
    );
  }

  InputDecoration DropDownDecor() {
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      border: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(1),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xfff80303), width: 4),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  InputDecoration InputFieldDecor({String hint = ""}) {
    return InputDecoration(
      counterText: "",
      hintText: hint,
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 2, 0),
      filled: true,
      fillColor: const Color(0xEEF7F7F7),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(1)),
      errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(1)),
      focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54, width: 2),
          borderRadius: BorderRadius.circular(1)),
      enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff9d9b9b), width: 2),
          borderRadius: BorderRadius.circular(1)),
      hintStyle: const TextStyle(
          color: Color(0xff9d9b9b),
          fontWeight: FontWeight.bold,
          fontFamily: Constants.ENG_FONT,
          fontSize: Constants.PLACEHOLDER_FS),
      border: InputBorder.none,
    );
  }

  InputDecoration InputFieldDecorWithIcon(IconData icon) {
    return InputDecoration(
      counterText: "",
      contentPadding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
      filled: true,
      suffixIcon: Icon(
        icon,
      ),
      fillColor: Colors.white,
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26, width: 2),
          borderRadius: BorderRadius.circular(1)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26, width: 2),
          borderRadius: BorderRadius.circular(1)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(1)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26, width: 2),
          borderRadius: BorderRadius.circular(1)),
      hintStyle: const TextStyle(
          color: Color(0xff9d9b9b),
          fontWeight: FontWeight.bold,
          fontFamily: Constants.ENG_FONT,
          fontSize: Constants.PLACEHOLDER_FS),
      border: InputBorder.none,
    );
  }

  TextStyle InputTextStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: Constants.TEXTFIELD_FS,
        fontFamily: Constants.ENG_FONT);
  }

  TextStyle InputTextStyleUrdu() {
    return const TextStyle(
        color: Colors.black,
        fontSize: Constants.TEXTFIELD_URDU_FS,
        fontFamily: Constants.URDU_FONT);
  }

  TextStyle DropDownTextStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: Constants.TEXTFIELD_FS,
        fontFamily: Constants.ENG_FONT);
  }

  TextStyle DropDownTextStyleUrdu() {
    return const TextStyle(
        color: Colors.black,
        fontSize: Constants.DROPDOWN_URDU_FS,
        fontFamily: Constants.URDU_FONT);
  }

  TextStyle InputTextStyleReadOnly() {
    return const TextStyle(
        color: Colors.grey,
        //fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: Constants.ENG_FONT);
  }

  TextStyle InputTextStyleReadOnlyUrdu() {
    return const TextStyle(
        color: Colors.grey,
        //fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: Constants.URDU_FONT);
  }

  Widget ShowHeading(String heading) {
    return Row(children: <Widget>[
      Expanded(
          child: Divider(
        thickness: 4,
        color: CustomColors.PrimaryColor,
      )),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Container(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 250),
          child: Text(
            heading,
            style: const TextStyle(
                fontFamily: Constants.ENG_FONT,
                fontSize: Constants.SCREEN_SUBHEAD_ENG_FS,
                fontWeight: FontWeight.bold),
            maxLines: 10,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Expanded(
          child: Divider(
        thickness: 4,
        color: CustomColors.PrimaryColor,
      )),
    ]);
  }

  Widget TrackingItem(BuildContext context, String title, String? info) {
    if (info != null && info.isNotEmpty && info != "") {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: Text(info,
                  maxLines: 10,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

extension numberExtension on num {
  bool get isInteger => (this % 1) == 0;

  bool get isDecimal => (this % 1) != 0;
}
