enum ExceptionMessageType {
  emptyPassword('비밀번호를 입력하세요.'),
  invalidPassword('비밀번호 형식을 맞춰주세요.'),
  emptyEmail('이메일을 입력하세요.'),
  invalidEmail('이메일 형식을 입력하세요.'),
  undefined('오류가 발생했습니다.');

  final String msg;
  const ExceptionMessageType(this.msg);

  factory ExceptionMessageType.getType(String msg) {
    return ExceptionMessageType.values.firstWhere((value) => value.msg == msg,
        orElse: () => ExceptionMessageType.undefined);
  }
}
