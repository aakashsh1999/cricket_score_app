import 'package:azul_football/models/events.dart';

class EventsApi {
  static List<EventsModel> eListEvents = [
    EventsModel(
      id: '0',
      logoAway:
          'https://ssl.gstatic.com/onebox/media/sports/logos/-WjHLbBIQO9xE2e2MW3OPQ_48x48.png',
      logoHome:
          'https://ssl.gstatic.com/onebox/media/sports/logos/bXkiyIzsbDip3x2FFcUU3A_48x48.png',
      nameAway: 'Wolves',
      nameHome: 'West Ham',
      scoreAway: 2,
      scoreHome: 3,
      dateMatch: 'Today, 9:24 PM',
      timeMatch: '75:04',
    ),
    EventsModel(
      id: '1',
      logoAway:
          'https://ssl.gstatic.com/onebox/media/sports/logos/udQ6ns69PctCv143h-GeYw_48x48.png',
      logoHome:
          'https://ssl.gstatic.com/onebox/media/sports/logos/EKIe0e-ZIphOcfQAwsuEEQ_48x48.png',
      nameAway: 'Man United',
      nameHome: 'Brighton',
      scoreAway: 2,
      scoreHome: 1,
      dateMatch: 'Today, 12:30 PM',
      timeMatch: '23:45',
    ),
    EventsModel(
      id: '2',
      logoAway:
          'https://ssl.gstatic.com/onebox/media/sports/logos/wF8AgQsssfy3_GLyVR3dSg_48x48.png',
      logoHome:
          'https://ssl.gstatic.com/onebox/media/sports/logos/4us2nCgl6kgZc0t3hpW75Q_48x48.png',
      nameAway: 'Sheffield United',
      nameHome: 'Arsenal',
      scoreAway: 0,
      scoreHome: 0,
      dateMatch: 'Today, 15:24 PM',
      timeMatch: '',
    ),
    EventsModel(
      id: '3',
      logoAway:
          'https://ssl.gstatic.com/onebox/media/sports/logos/C3J47ea36cMBc4XPbp9aaA_48x48.png',
      logoHome:
          'https://ssl.gstatic.com/onebox/media/sports/logos/8piQOzndGmApKYTcvyN9vA_48x48.png',
      nameAway: 'Everton',
      nameHome: 'Crystal Palace',
      scoreAway: 1,
      scoreHome: 1,
      dateMatch: 'Today, 17:00 PM',
      timeMatch: '90+6',
    ),
  ];
}
