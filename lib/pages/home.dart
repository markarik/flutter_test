import 'package:flutter/material.dart';
import './components/league_card.dart';
import './components/custom_app_bar.dart';
import '../api/data_fetcher.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<dynamic> leagues = [];
  List<dynamic> standings = [];

  @override
  void initState() {
    super.initState();
    _setLeagues();
    _setStandings();
  }

  _setLeagues() async {
    List<dynamic> fetchedLeagues = await DataFetcher.fetchLeagues();
    setState(() {
      leagues.addAll(fetchedLeagues);
    });
  }

  _setStandings() async {
    List<dynamic> fetchedStandings = await DataFetcher.fetchStandings();
    setState(() {
      standings.addAll(fetchedStandings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // MAIN STACK IS THE WHOLE SCREEN COLOR
          Container(color: Colors.grey[300]),
          // APPBAR STACKED ON TOP
          CustomAppBar('Leagues', Colors.redAccent),
          // LEAGUE CARD BUILT BY THE API DATA
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: ListView.builder(
              itemCount: leagues.length,
              itemBuilder: (BuildContext context, int index) {
                return LeagueCard(leagues[index], standings);
              },
            ),
          )
        ],
      ),
    );
  }
}
