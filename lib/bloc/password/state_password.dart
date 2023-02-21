import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PasswordCheckState {}

class ValidationModel extends Equatable {
  final String validation;
  final bool isOk;
  const ValidationModel({required this.validation, required this.isOk});

  @override
  List<Object> get props => [validation, isOk];
}

class ReadyForStart extends PasswordCheckState {}

class ValidationState extends PasswordCheckState {
  final bool totalOk;
  List<ValidationModel> steps;

  ValidationState({required this.totalOk, required this.steps});
}
