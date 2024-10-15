import 'package:almanada_app/core/widgets/app_bar_widget.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/icon_button_widget.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/profile/data/models/setting_model.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  SettingModel? settingModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<HistoryCubit>()..getSettings(),
      child: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) => di.sl<HistoryCubit>(),
        builder: (context, state) {
          settingModel = HistoryCubit.get(context).settingModel;
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
              return Padding(
                padding: paddingExt(bottom: 10, top: 25, start: 20, end: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Image.network(
                        settingModel!.data!.about_img_ar!,
                        height: context.dHeight * 0.3,
                        width: context.dWidth * 0.5,
                        fit: BoxFit.fill,
                      ),
                    ),
                    40.hBox,
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: TextWidget(
                        settingModel!.data!.about_title_ar!,
                        textAlign: TextAlign.center,
                        style: textStyle24(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    10.hBox,
                    TextWidget(
                      settingModel!.data!.about_desc_ar!,
                      textAlign: TextAlign.center,
                      style: textStyle16(
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    40.hBox,
                    const Divider(),
                    Row(
                      children: [
                        TextWidget(
                          "الجوال :",
                          textAlign: TextAlign.center,
                          style: textStyle18(
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        5.wBox,
                        InkWell(
                          onTap: () {
                            launchUrlString(
                                "tel://${settingModel!.data!.phone!}");
                          },
                          child: TextWidget(
                            settingModel!.data!.phone!,
                            textAlign: TextAlign.center,
                            style: textStyle18(
                              height: 1.4,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButtonWidget(
                          icon: AppImages.facebook,
                          sizeIcon: 24.0,
                          onTap: () {
                            final Uri _url =
                                Uri.parse(settingModel!.data!.facebook_link!);
                            _launchUrl(_url);
                          },
                        ),
                        IconButtonWidget(
                          icon: AppImages.xLogo,
                          sizeIcon: 24.0,
                          onTap: () {
                            final Uri _url =
                                Uri.parse(settingModel!.data!.twitter_link!);
                            _launchUrl(_url);
                          },
                        ),
                        IconButtonWidget(
                          icon: AppImages.instagram,
                          sizeIcon: 24.0,
                          onTap: () {
                            final Uri _url =
                                Uri.parse(settingModel!.data!.instagram_link!);
                            _launchUrl(_url);
                          },
                        ),
                        IconButtonWidget(
                          icon: AppImages.tiktok,
                          sizeIcon: 24.0,
                          onTap: () {
                            final Uri _url =
                                Uri.parse(settingModel!.data!.tiktok!);
                            _launchUrl(_url);
                          },
                        ),
                        IconButtonWidget(
                          icon: AppImages.snap,
                          sizeIcon: 24.0,
                          onTap: () {
                            final Uri _url =
                                Uri.parse(settingModel!.data!.snap!);
                            _launchUrl(_url);
                          },
                        ),
                        IconButtonWidget(
                          icon: AppImages.linked,
                          sizeIcon: 24.0,
                          onTap: () {
                            final Uri _url =
                                Uri.parse(settingModel!.data!.linkedin_link!);
                            _launchUrl(_url);
                          },
                        ),
                        IconButtonWidget(
                          icon: AppImages.whatsApp,
                          sizeIcon: 24.0,
                          onTap: () {
                            final Uri _url =
                                Uri.parse(settingModel!.data!.Whatsapp_link!);
                            _launchUrl(_url);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          }

          return Scaffold(
            appBar: AppBarWidget(
              title: TextWidget(
                AppStrings.aboutApp,
                style: textStyle14(color: AppColors.white),
              ),
            ),
            body: _body1(),
          );
        },
      ),
    );
  }
}

Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
