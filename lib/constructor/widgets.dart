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
  func: nearest_record,
  parameters: {
    'showCoach': true,
    'fontSize': 16
  },
);