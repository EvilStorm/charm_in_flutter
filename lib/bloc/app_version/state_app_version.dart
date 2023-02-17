import 'package:charmin/bloc/fetch_response.dart';
import 'package:charmin/bloc/fetch_state.dart';

class CurrentAppVersionLoaded extends FetchState {
  final FetchResponse response;

  CurrentAppVersionLoaded({
    required this.response,
  });
}
