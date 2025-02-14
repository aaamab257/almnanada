import 'package:almanada_app/constatnts.dart';
import 'package:almanada_app/util/enums.dart';

import 'package:devicelocale/devicelocale.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecases/local_use_case/change_local_lang.dart';
import '../../../domain/usecases/local_use_case/get_saved_lang.dart';

part 'local_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(ChangeLocaleState(Locale(AppConstants.englishCode)));

  static LocaleCubit get(context) => BlocProvider.of(context);

  String currentLangCode = AppConstants.englishCode;

  Future<String> getCurrentLang() async {
    String? currentLangCode = await Devicelocale.currentLocale;
    if (currentLangCode!.contains('ar')) {
      currentLangCode = 'ar';
      await _changeLang(currentLangCode);
      return currentLangCode;
    } else {
      currentLangCode = 'en';
      await _changeLang(currentLangCode);
      return currentLangCode;
    }
  }

  Future<String> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppConstants.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
    return currentLangCode;
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);

    response.fold((failure) => debugPrint(AppConstants.cacheFailure), (value) {
      print("Fold value ============= $langCode ");
      emit(ChangeLocaleState(Locale(langCode)));
      // emit(ChangeLocaleStateLoading(Locale(langCode)));
      // langCode = langCode;
    });
  }

  Future<void> toEnglish() async => await _changeLang(AppConstants.englishCode);

  Future<void> toArabic() async => await _changeLang(AppConstants.arabicCode);
}
