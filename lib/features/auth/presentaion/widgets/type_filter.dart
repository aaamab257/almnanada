import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TypeFilter extends StatefulWidget {
  List<String>? itemsList;

  TypeFilter({
    required this.itemsList,
  });

  @override
  _TypeFilterState createState() => _TypeFilterState();
}

class _TypeFilterState extends State<TypeFilter> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      style: textStyle16(),
      padding: paddingExt(top: 8, start: 8, end: 8, bottom: 8),
      dropdownColor: AppColors.primary,
      hint: TextWidget(
        LoginCubit.get(context).selectedType.isEmpty
            ? AppStrings.accType
            : LoginCubit.get(context).selectedType == "observer"
                ? "مشرف"
                : LoginCubit.get(context).selectedType == "parent"
                    ? "اب"
                    : "",
        style: textStyle16(),
      ),

      //icon: Icon(Icons.arrow_drop_down_circle),
      elevation: 0,
      onChanged: (String? newValue) {
        newValue == 'مشرف'
            ? LoginCubit.get(context).selectedType = "observer"
            : LoginCubit.get(context).selectedType = "parent";
        print(LoginCubit.get(context).selectedType);
        setState(() {});
      },
      items: widget.itemsList!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: TextWidget(
            value,
            style: textStyle16(color: AppColors.white),
          ),
        );
      }).toList(),
    );
  }
}
