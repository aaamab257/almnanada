import 'package:almanada_app/util/enums.dart';

import 'ar_translations.dart';
import 'en_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    LanguageType.ar.name: ar,
    LanguageType.en.name: en,
  };
}
