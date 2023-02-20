import 'package:charmin/bloc/fetch_response.dart';
import 'package:charmin/bloc/fetch_state.dart';

abstract class AppVersionState with FetchState {}

class LastedVersion extends AppVersionState {}

class HasNewVersion<T> extends AppVersionState {
  final FetchResponse<T> response;
  HasNewVersion({
    required this.response,
  });
}
