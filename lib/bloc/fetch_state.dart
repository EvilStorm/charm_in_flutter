import 'package:flutter/foundation.dart';

@immutable
abstract class FetchState {}

class Empty extends FetchState {}

class Loading extends FetchState {}

class Loaded extends FetchState {}

class Error extends FetchState {
  final String message;
  final Exception? e;
  Error({required this.message, this.e});
}
