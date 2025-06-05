import 'functions.dart';
import 'models.dart';

GAWidget gaWidget1 = GAWidget(
  id: 1,
  category: "ss",
  func: club_card,
  parameters: {
    'verticalMargin': 16,
    'fontSize': 16,
  },
);
GAWidget gaWidget2 = GAWidget(
  id: 2,
  category: "ss",
  func: nearest_record,
  parameters: {
    'showCoach': false,
    'fontSize': 20
  },
);

GAWidget gaWidget3 = GAWidget(
  id: 3,
  category: "ss",
  func: all_trainer_button,
  parameters: {
    'caption': 'Тренеры',
    'description': 'Крутые перцы'
  },
);

GAWidget gaWidget4 = GAWidget(
  id: 4,
  category: "ss",
  func: record,
  parameters: {
    'caption': 'Записаться',
    'description': 'чтобы было круто'
  },
);

GAWidget gaWidget5 = GAWidget(
  id: 5,
  category: "ss",
  func: buildButton,
  parameters: {
    'title': 'Тренеры',
    'subtitle': 'Крутые перцы'
  },
);

GAWidget gaWidget6 = GAWidget(
  id: 6,
  category: "ss",
  func: buildButton2,
  parameters: {
    'title': 'Тренеры',
    'subtitle': 'Крутые перцы',
    'title2': 'Клуб',
    'subtitle3': '7:00-18:00'
  },
);

GAWidget gaWidget7 = GAWidget(
  id: 7,
  category: "ss",
  func: baseText,
  parameters: {
    'text': 'Привет, Мир!',
    'fontSize': 18,
  },
);

