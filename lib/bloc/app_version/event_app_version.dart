import 'package:charmin/bloc/fetch_event.dart';

class AppVerLatestEvent extends FetchEvent {}

class AppVerCheckUpdateEvent extends FetchEvent {}

class SkipThisVerEvent extends FetchEvent {
  int versionNumber;
  SkipThisVerEvent({required this.versionNumber});
}
