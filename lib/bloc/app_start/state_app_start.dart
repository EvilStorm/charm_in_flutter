import 'package:flutter/foundation.dart';

@immutable
abstract class AppStartState {}

class ReadyForStart extends AppStartState {}

class StartMain extends AppStartState {}

class StartSignIn extends AppStartState {}
