import 'package:flutter/material.dart';

class ObserverMainState extends Equatable {
  ObserverMainState({
    this.currentIndex = 0,
    this.titles = const [],
    this.pages = const [],
    this.content = const [],
    this.onTaps = const [],
  });
  final int currentIndex;
  final List<Widget> pages;
  final List<String> titles, content;
  final List<VoidCallback> onTaps;

  ObserverMainState copyWith({
    int? currentIndex,
    List<String>? titles,
    List<Widget>? pages,
    List<String>? content,
    List<VoidCallback>? onTaps,
  }) =>
      ObserverMainState(
        currentIndex: currentIndex ?? this.currentIndex,
        titles: titles ?? this.titles,
        pages: pages ?? this.pages,
        content: content ?? this.content,
        onTaps: onTaps ?? this.onTaps,
      );

  List<Object?> get props => [
        currentIndex,
        titles,
        pages,
        content,
        onTaps,
      ];
}

class Equatable {}
