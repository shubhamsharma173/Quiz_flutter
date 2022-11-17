class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "What is the flavour profile of Oaken Glow?",
    "options": ['Smoky', 'Fruity', 'Floral', 'Woody'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Is Dalmunach distillery home to Oaken Glow?",
    "options": ['Yes', 'No'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "What makes Oaken Glow a truly Smoky Whisky?",
    "options": ['Peat Infused', 'Crafted By fire', 'Both (a) & (b)', 'None'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question":
        "Oaken glow is a unique blend of scotch malts and Indian grain spirits",
    "options": ['Yes', 'No'],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "What is the Tagline of Oaken Glow?",
    "options": [
      'Smoky taste crafted by fire',
      'Oak Infused Peat Fired, \npremium whisky',
      'Fiery blend whisky',
      'Premium Scotch Whisky'
    ],
    "answer_index": 0,
  },
];
