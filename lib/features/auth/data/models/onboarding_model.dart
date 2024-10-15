class OnboardingModel {
  int? status;
  String? msg;
  OnboardingData? data;
  OnboardingModel({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class OnboardingData {
  List<OnboardingDetails>? onboardingDetails;
  OnboardingData({
    required this.onboardingDetails,
  });
  OnboardingData.fromJson(Map<String, dynamic> json) {
    if (json['onboarding'] != null) {
      onboardingDetails = <OnboardingDetails>[];
      json['onboarding'].forEach((v) {
        onboardingDetails!.add(OnboardingDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (onboardingDetails != null) {
      data['onboarding'] = onboardingDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// "status": 200,
//     "msg": "تم اظهار البيانات بنجاح",
//     "data": {
//         "onboarding": [
//             {
//                 "id": 1,
//                 "photo": "https://almnadah.com/onboardings/1724109818.png",
//                 "name": "برنامج المناداة",
//                 "desc": "يهدف البرنامج الي أهمية التواصل السريع والفعال بين المدرسة وأولياء الأمور.تعزيز المشاركة الفعالة لأولياء الأمور في التعليم والتقدم الأكاديمي للطلاب"
//             },
//             {
//                 "id": 2,
//                 "photo": "https://almnadah.com/onboardings/1724109898.jpg",
//                 "name": "مميزات التطبيق",
//                 "desc": "-اشعارات فورية عند استدعاء الطالب.   -متابعة وصول ولي الأمر في الوقت الفعلي. - تحديد مواعيد استدعاء أولياء الأمور وفقاً للجدول الزمني المدرسي - إرسال دعوات رسمية عبر البريد الإلكتروني أو الرسائل النصية."
//             },
//             {
//                 "id": 3,
//                 "photo": "https://almnadah.com/onboardings/1724110044.png",
//                 "name": "اهداف برنامج المناداة",
//                 "desc": "اطلاع أولياء الأمور على أداء أبنائهم الأكاديمي والسلوكي من خلال تسجيل الدخول بايميل خاص لكل ولي امر    \u000b                   \t-يعمل البرنامج علي بناء شراكة قوية بين المدرسة والأسرة لدعم الطلاب\u000b- يسهم التطبيق في تحسين الأمان والكفاءة في استدعاء الأولياء."
//             }
//         ]
//     }

class OnboardingDetails {
  int? id;

  String? photo;
  String? name;
  String? desc;

  OnboardingDetails({
    required this.id,
    required this.photo,
    required this.name,
    required this.desc,
  });

  OnboardingDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['photo'] = photo;
    data['name'] = name;
    data['desc'] = desc;

    return data;
  }
}
