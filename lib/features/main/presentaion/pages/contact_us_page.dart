import 'package:almanada_app/core/widgets/app_bar_widget.dart';
import 'package:almanada_app/core/widgets/custom_snakbar.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/text_input_widget.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';

import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:almanada_app/util/extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: AppStrings.contactUs,
        ),
        body: BlocProvider(
            create: (context) => di.sl<HistoryCubit>(),
            child: BlocConsumer<HistoryCubit, HistoryState>(
                listener: (context, state) => di.sl<HistoryCubit>(),
                builder: (context, state) {
                  Widget _body1() {
                    if (state is HistoryLoading) {
                      return const LoadingScreen();
                    } else if (state is HistoryError) {
                      return AppErrorWidget(
                        onPress: () {
                          setState(() {});
                        },
                      );
                    } else {
                      return SingleChildScrollView(
                        padding:
                            paddingExt(start: 20, top: 30, end: 20, bottom: 30),
                        child: Column(
                          children: [
                            Image.asset(
                              AppImages.horizontalLogo,
                              height: context.dHeight * 0.30,
                              width: context.dWidth * 0.3,
                              fit: BoxFit.contain,
                            ),
                            15.hBox,
                            TextInputWidget(
                              controller: _email,
                              title: AppStrings.email,
                              hintText: AppStrings.email,
                              prefixIcon: AppImages.user,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            15.hBox,
                            TextInputWidget(
                              controller: _phone,
                              title: AppStrings.phoneNumber,
                              hintText: AppStrings.phoneNumber,
                              prefixIcon: AppImages.user,
                              keyboardType: TextInputType.number,
                            ),
                            15.hBox,
                            TextInputWidget(
                              controller: _message,
                              title: AppStrings.message,
                              hintText: AppStrings.message,
                              isRequired: false,
                              minLines: 8,
                              maxLines: 8,
                            ),
                            MainButtonWidget(
                              title: AppStrings.send,
                              padding: paddingExt(start: 15, top: 30, end: 15),
                              onPressed: () async {
                                if (_email.text.isEmpty) {
                                  showSnackBar(context,
                                      "يرجي ادخال البريد الالكتروني الخاص بك");
                                } else if (_phone.text.isEmpty) {
                                  showSnackBar(context,
                                      "يرجي ادخال رقم الجوال الخاص بك");
                                } else if (_message.text.isEmpty) {
                                  showSnackBar(context, "يرجي ادخال الرساله");
                                } else {
                                  await HistoryCubit.get(context)
                                      .contactus(
                                          _email.text.trim(),
                                          _phone.text.trim(),
                                          "السلام عليكم",
                                          _message.text.trim())
                                      .then((onValue) async {
                                    if (onValue.code == 200) {
                                      showSnackBar(context, onValue.msg!);
                                    } else {
                                      showSnackBar(context,
                                          "حدث خطأ برجاء المحاولة في وقت لاحق");
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  }

                  return _body1();
                })));
  }
}
