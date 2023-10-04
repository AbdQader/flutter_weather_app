class Condition {
  String text;
  String icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json['text'],
    icon: json['icon'],
    code: json['code'],
  );

  Map<String, dynamic> toJson() => {
    'text': text,
    'icon': icon,
    'code': code,
  };
}
