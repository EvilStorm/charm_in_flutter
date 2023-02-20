class FetchResponse<T> {
  int stateCode;
  T? model;
  FetchResponse({
    required this.stateCode,
    this.model,
  });
}
