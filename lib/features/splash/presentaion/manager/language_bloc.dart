import 'dart:ui';

import 'package:almanada_app/features/splash/domain/usecases/language_event.dart';
import 'package:almanada_app/features/splash/domain/usecases/language_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(const Locale('ar', 'AR'))) {
    // Registering the event handler
    on<ChangeLanguage>((event, emit) {
      emit(LanguageState(event.locale));
      Get.updateLocale(event.locale);
      // Emit the new language state
    });
  }
}
