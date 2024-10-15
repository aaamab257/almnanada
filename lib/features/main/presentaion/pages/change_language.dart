import 'package:almanada_app/core/widgets/app_bar_widget.dart';
import 'package:almanada_app/features/splash/domain/usecases/language_event.dart';

import 'package:almanada_app/features/splash/presentaion/manager/language_bloc.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String? lang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.language,
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(
                color: Theme.of(context).iconTheme.color,
                Icons.language_outlined,
              ),
              title: Text(
                "اللغه العربية",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () async {
                context
                    .read<LanguageBloc>()
                    .add(ChangeLanguage(const Locale('ar', 'AR')));
                Get.back();
              },
              trailing: Icon(
                Icons.refresh,
                color: Theme.of(context).iconTheme.color,
                size: 20,
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(
                color: Theme.of(context).iconTheme.color,
                Icons.language_outlined,
              ),
              title: Text(
                "English",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () async {
                context
                    .read<LanguageBloc>()
                    .add(ChangeLanguage(const Locale('en', 'US')));
                Get.back();
              },
              trailing: Icon(
                Icons.refresh,
                color: Theme.of(context).iconTheme.color,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
