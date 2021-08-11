import 'package:azul_football/models/leagues.dart';

class LeaguesApi {
  static List<LeaguesModels> lLeaguesList = [
    LeaguesModels(
      id: 0,
      name: 'Premier League',
      logo: 'assets/images/leagues/premier.png',
    ),
    LeaguesModels(
      id: 1,
      name: 'La Liga',
      logo: 'assets/images/leagues/laliga.png',
    ),
    LeaguesModels(
      id: 2,
      name: 'EFL Championship',
      logo: 'assets/images/leagues/efl.png',
    ),
    LeaguesModels(
      id: 3,
      name: 'Europa League',
      logo: 'assets/images/leagues/europa.png',
    ),
    LeaguesModels(
      id: 4,
      name: 'Bundesliga',
      logo: 'assets/images/leagues/bundesliga.png',
    ),
  ];
}
