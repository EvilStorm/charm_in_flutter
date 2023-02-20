enum SignedType {
  google('google', 1),
  kakaoTalk('kakaoTalk', 2),
  facebook('facebook', 3),
  apple('apple', 4),
  email('email', 0),
  undefined('undefinded', -1);

  final String name;
  final int type;
  const SignedType(this.name, this.type);

  factory SignedType.getType(String name) {
    return SignedType.values.firstWhere((value) => value.name == name,
        orElse: () => SignedType.undefined);
  }
}
