import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:flutter/material.dart';

Padding getDefaultInputField(
    TextEditingController controller,
    String textFieldLabel,
    bool isTextFieldEnable,
    List<Unit> dropdownList,
    Unit dropdownValue,
    ValueChanged<Unit?>? onChanged) {
  return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 3,
          child: TextField(
            enabled: isTextFieldEnable,
            autofocus: true,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: textFieldLabel),
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: DropdownButton(
                    value: dropdownValue,
                    items: dropdownList
                        .map((e) => DropdownMenuItem<Unit>(
                              value: e,
                              child: Text(e.term),
                            ))
                        .toList(),
                    onChanged: onChanged)))
      ]));
}

Padding getDefaultInputFieldWithoutDropdown(TextEditingController controller,
    String textFieldLabel, bool isTextFieldEnable) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: TextField(
      enabled: isTextFieldEnable,
      autofocus: true,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: textFieldLabel),
    ),
  );
}
