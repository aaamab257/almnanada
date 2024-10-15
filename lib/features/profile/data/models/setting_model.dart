class SettingModel {
  int? status;
  String? msg;
  SettingModelData? data;
  SettingModel({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class SettingModelData {
  String? name_ar;
  String? address_ar;
  String? fivacon;
  String? login_app_img;
  String? logo;
  String? phone;
  String? email;
  String? facebook_link;
  String? twitter_link;
  String? linkedin_link;
  String? about_title_ar;
  String? instagram_link;
  String? about_desc_ar;
  String? about_img_ar;
  String? tiktok;
  String? snap;
  String? splashScreenImg;
  String? Whatsapp_link;

  SettingModelData({
    required this.name_ar,
    required this.splashScreenImg,
    required this.address_ar,
    required this.fivacon,
    required this.login_app_img,
    required this.logo,
    required this.phone,
    required this.snap,
    required this.email,
    required this.facebook_link,
    required this.tiktok,
    required this.twitter_link,
    required this.linkedin_link,
    required this.instagram_link,
    required this.about_title_ar,
    required this.about_desc_ar,
    required this.about_img_ar,
    required this.Whatsapp_link,
  });

  SettingModelData.fromJson(Map<String, dynamic> json) {
    name_ar = json['name'];
    address_ar = json['address'];
    splashScreenImg = json['splashscreen'];
    fivacon = json['Fivacon'];
    login_app_img = json['login_app_img'];
    logo = json['logo'];
    Whatsapp_link = json['Whatsapp_link'];
    phone = json['phone'];
    email = json['email'];
    snap = json['snapchat_link'];
    facebook_link = json['facebook_link'];
    instagram_link = json['insta_link'];
    tiktok = json['TikTokLink'];
    twitter_link = json['twitter_link'];
    linkedin_link = json['linkedin_link'];
    about_title_ar = json['about_title'];
    about_desc_ar = json['about_desc'];

    about_img_ar = json['about_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name_ar;
    data['address'] = address_ar;
    data['splashscreen'] = splashScreenImg;
    data['Fivacon'] = fivacon;
    data['login_app_img'] = login_app_img;
    data['logo'] = logo;
    data['Whatsapp_link'] = Whatsapp_link;
    data['phone'] = phone;
    data['email'] = email;
    data['insta_link'] = instagram_link;
    data['TikTokLink'] = tiktok;
    data['snapchat_link'] = snap;
    data['facebook_link'] = facebook_link;
    data['twitter_link'] = twitter_link;
    data['linkedin_link'] = linkedin_link;
    data['about_title'] = about_title_ar;
    data['about_desc'] = about_desc_ar;

    data['about_img'] = about_img_ar;

    return data;
  }
}
