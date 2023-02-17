import 'package:charmin/bloc/fetch_event.dart';

class AppVerLatestEvent extends FetchEvent {}

class AppVerCheckUpdateEvent extends FetchEvent {
  int versionCode;
  String versionName;
  AppVerCheckUpdateEvent(
      {required this.versionCode, required this.versionName});
}
