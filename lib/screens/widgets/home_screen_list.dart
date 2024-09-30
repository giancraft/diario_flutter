import 'package:diario/models/journal.dart';
import 'package:diario/screens/widgets/journal_card.dart';

List<JournalCard> generateListJournalCards(
  {required int windowPage,
  required DateTime currentDay,
  required Map<String, Journal> dataBase}
) {
  List<JournalCard> list = List.generate(
    windowPage + 1, 
    (index) => JournalCard(
      showedDate: currentDay.subtract(Duration(days: (windowPage) - index))
    )
  );

  dataBase.forEach((key, value) {
    if (value.createdAt.isAfter(currentDay.subtract(Duration(days: windowPage)))) {
      int difference = value.createdAt
          .difference(currentDay.subtract(Duration(days: windowPage)))
          .inDays
          .abs();
      
      list[difference] = JournalCard(
        showedDate: list[difference].showedDate,
        journal: value, 
      );
    }
  });
  return list;
}