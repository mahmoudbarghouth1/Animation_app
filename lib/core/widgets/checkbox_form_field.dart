import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    required String title,
    required FormFieldSetter<bool> super.onSaved,
    required FormFieldValidator<bool> super.validator,
    bool super.initialValue = false,
  }) : super(
         builder: (FormFieldState<bool> state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               CheckboxListTile(
                 value: state.value,
                 onChanged: (value) {
                   state.didChange(value);
                 },
                 title: Text(
                   title,
                   style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                   ),
                 ),
                 controlAffinity: ListTileControlAffinity.leading,
               ),
               if (state.hasError)
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0),
                   child: Text(
                     state.errorText ?? '',
                     style: TextStyle(
                       color: Colors.redAccent,
                       fontSize: 12,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
             ],
           );
         },
       );
}

// import 'package:flutter/material.dart';
// import 'package:sign/core/app_theme.dart';

// class CheckBoxListtileWidget extends StatefulWidget {
//   const CheckBoxListtileWidget({
//     super.key,
//     required this.title,
//     required this.formKey,
//   });
//   final String title;
//   final GlobalKey<FormState> formKey;

//   @override
//   State<CheckBoxListtileWidget> createState() => _CheckBoxListtileWidgetState();
// }

// class _CheckBoxListtileWidgetState extends State<CheckBoxListtileWidget> {
//   @override
//   Widget build(BuildContext context) {
//     bool isConnected = false;
//     return CheckboxListTile(
//       value: isConnected,
//       onChanged: (bool? value) {
//         setState(() {
//           isConnected = value!;
//           widget.formKey.currentState!.validate();
//         });
//       },
//       title: Text(
//         widget.title,
//         textAlign: TextAlign.left,
//         style: appTheme.textTheme.bodyMedium,
//       ),
//       controlAffinity: ListTileControlAffinity.leading,
//       contentPadding: EdgeInsets.zero,
//       dense: true,
//     );
//   }
// }
