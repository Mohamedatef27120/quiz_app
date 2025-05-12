enum QuestionType {
  single,
  multiple,
}

class QuestionModel {
  final String text;
  final List<String> options;
  final QuestionType type;

  QuestionModel({
    required this.text,
    required this.options,
    required this.type,
  });
}
