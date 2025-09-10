// import 'package:flutter/material.dart';

// class CustomDropdownField extends StatelessWidget {
//   final String? value;
//   final List<DropdownMenuItem<String>> items;
//   final String hintText;
//   final Function(String?) onChanged;
//   final String? Function(String?)? validator;
//   final InputDecoration? decoration;
//   final Widget? hintWidget;
//   final AutovalidateMode? autoValidateMode;

//   const CustomDropdownField({
//     super.key,
//     required this.value,
//     required this.items,
//     required this.hintText,
//     required this.onChanged,
//     this.validator,
//     this.decoration,
//     this.hintWidget,
//     this.autoValidateMode,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: (value?.isEmpty ?? true) ? null : value,
//       onChanged: onChanged,
//       validator: validator,
//       autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
//       decoration: decoration ??
//           InputDecoration(
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             fillColor: Colors.grey[200],
//             filled: true,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//           ),
//       hint: hintWidget ?? Text(hintText),
//       dropdownColor: Colors.white,
//       icon: const Icon(Icons.keyboard_arrow_down),
//       style: const TextStyle(fontSize: 16, color: Colors.black),
//       isExpanded: true,
//       items: items.map((item) {
//         return DropdownMenuItem<String>(
//           value: item.value,
//           child: DefaultTextStyle(
//             style: const TextStyle(fontSize: 16, color: Colors.black),
//             child: item.child,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownField extends StatelessWidget {
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final String hintText;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final Widget? hintWidget;
  final AutovalidateMode? autoValidateMode;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.decoration,
    this.hintWidget,
    this.autoValidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: (value?.isEmpty ?? true) ? null : value,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
      decoration: decoration ??
          InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
      hint: hintWidget ?? Text(hintText),
      dropdownStyleData: DropdownStyleData(
        elevation: 2,
        offset: const Offset(0, 0),
        maxHeight: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      style: const TextStyle(fontSize: 16, color: Colors.black),
      isExpanded: true,
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item.value,
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 16, color: Colors.black),
            child: item.child,
          ),
        );
      }).toList(),
    );
  }
}
