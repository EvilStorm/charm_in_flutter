abstract class AppStartEvent {}

class VersionCheckedEvent extends AppStartEvent {}

class CheckedSignEvent extends AppStartEvent {
  bool isSuccess;
  CheckedSignEvent({required this.isSuccess});
}
