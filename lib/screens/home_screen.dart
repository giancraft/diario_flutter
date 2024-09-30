import 'package:diario/database/database.dart';
import 'package:diario/models/journal.dart';
import 'package:diario/screens/widgets/home_screen_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentDay = DateTime.now();
  
  int windowPage = 10;

  Map<String, Journal> dataBase = {};

  final ScrollController _listScrollController = ScrollController();

  @override
  void initState(){
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${currentDay.day} | ${currentDay.month} | ${currentDay.year}",
        ),
      ),
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          windowPage: windowPage, 
          currentDay: currentDay, 
          dataBase: dataBase
          ),
      ),
    );
  }

  void refresh() {
    setState(() {
      dataBase = generateRandomDatabase(maxGap: windowPage, amount: 3);
    });
  }
}