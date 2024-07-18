import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'dropdown_model.dart';

class CustomDropDown extends StatelessWidget {
  final String? fieldTitle, hint;
  final DropdownModel? selectedItem;
  final List<DropdownModel> spinnerItemList;
  final Color? dropdownColor;
  final Color? titleColor, valueTextColor;
  final bool? isEnable;
  final double? manuMaxHeight;
  final void Function(DropdownModel) onChanged;

  const CustomDropDown(
      {Key? key,
      this.fieldTitle,
      required this.spinnerItemList,
      required this.onChanged,
      this.selectedItem,
      this.dropdownColor,
      this.hint,
      this.titleColor,
      this.manuMaxHeight,
      this.isEnable, this.valueTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldTitle != null
            ? FieldTitleText(
                text: fieldTitle!,
                color: titleColor,
              )
            : SizedBox(),
        fieldTitle != null
            ? const SizedBox(
                height: 3,
              )
            : SizedBox(),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: DropdownButton<DropdownModel>(
                  dropdownColor:dropdownColor??Colors.white,
                  hint: Text(
                    "$hint",
                    style: TextStyle(
                      fontSize: 14,
                      color:  Colors.black,
                    ),
                  ),
                  value: selectedItem,
                  
                  icon: const Icon(Icons.arrow_drop_down),
                  underline: const SizedBox(),
                  isExpanded: true,
                  // Hide default dropdown icon
                  elevation: 16,
                  menuMaxHeight: manuMaxHeight,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                  onChanged: isEnable == false
                      ? null
                      : (newValue) {
                          onChanged(newValue!);
                        },
                  items: spinnerItemList.map<DropdownMenuItem<DropdownModel>>(
                      (DropdownModel value) {
                    return DropdownMenuItem<DropdownModel>(
                      key: UniqueKey(), // Set a unique key here
                      value: value,
                      child: Text(value.name, style: TextStyle(
                        color: valueTextColor ?? Colors.black,
                      ),
                      textAlign: TextAlign.start,
                      ),
                      // child: CustomSimpleText(
                      //   text: value.name,
                      //   color: valueTextColor ?? Colors.black,
                      //   alignment: TextAlign.start,
                      // ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
