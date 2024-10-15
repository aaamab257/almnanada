import 'package:equatable/equatable.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryInitial extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistoryLoading extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistorySuccess extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistoryError extends HistoryState {
  @override
  List<Object> get props => [];
}
