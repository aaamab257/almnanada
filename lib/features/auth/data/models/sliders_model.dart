class Sliders {
  int? status;
  String? msg;
  DataSlider? data;
  Sliders({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class DataSlider {
  List<SlidersList>? list;
  DataSlider({
    required this.list,
  });
  DataSlider.fromJson(Map<String, dynamic> json) {
    if (json['Sliders'] != null) {
      list = <SlidersList>[];
      json['Sliders'].forEach((v) {
        list!.add(SlidersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['Sliders'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SlidersList {
  int? id;
  String? slider;

  String? url;

  SlidersList({
    required this.id,
    required this.slider,
    required this.url,
  });

  SlidersList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slider = json['slider'];

    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slider'] = slider;

    data['url'] = url;

    return data;
  }
}
