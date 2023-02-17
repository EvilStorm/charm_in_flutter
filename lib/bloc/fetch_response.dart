class FetchResponse<T> {
  int stateCode;
  T model;
  FetchResponse({
    required this.stateCode,
    required this.model,
  });
}
