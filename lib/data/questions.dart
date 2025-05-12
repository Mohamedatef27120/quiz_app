import '../models/question_model.dart';

final List<QuestionModel> questions = [
  QuestionModel(
    text: 'How would you describe your level of satisfaction with the healthcare system?',
    options: ['Strongly satisfied', 'Satisfied', 'Neutral', 'Not satisfied'],
    type: QuestionType.single,
  ),
  QuestionModel(
    text: 'What vitamins do you take?',
    options: ['Vitamin D3', 'Vitamin B', 'Zinc', 'Magnesium'],
    type: QuestionType.multiple,
  ),
  QuestionModel(
    text: 'How often do you exercise?',
    options: ['Daily', 'Few times a week', 'Rarely', 'Never'],
    type: QuestionType.single,
  ),
  QuestionModel(
    text: 'بتعمل ايه لما بتقوم من النوم',
    options: ['بترتب سريرك', 'بتغسل وشك', 'بتمسك الموبايل', 'بتنام تاني'],
    type: QuestionType.multiple,
  ),
  QuestionModel(
    text: 'عدد اضلاع المثلث',
    options: ['3', '9-6', '9/3', '0'],
    type: QuestionType.multiple,
  ),
];
