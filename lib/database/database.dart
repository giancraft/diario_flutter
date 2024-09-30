import 'dart:math';

import 'package:diario/helpers/phrases.dart';
import 'package:diario/models/journal.dart';
import 'package:uuid/uuid.dart';

Map<String, Journal> generateRandomDatabase({
  required int maxGap,
  required int amount,
}) {
  Random rng = Random();

  Map <String, Journal> map = {};

  for (int i = 0; i < amount; i++){
    int timeGap = rng.nextInt(maxGap - 1);
    DateTime date = DateTime.now().subtract(
      Duration(days: timeGap),
    );

    String id = const Uuid().v1();

    map[id] = Journal(
      id: id,
      content: getRandomPhrase(), 
      createdAt: date, 
      updatedAt: date
    );
  }
  return map;
}