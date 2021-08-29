
class EventsModel {
  final int id;
//  final String name;
  final String type;
  final String status;
  final String localTeamScore;
  final String localTeamWicket;
  final String visitorTeamScore;
  final String visitorTeamWicket;
  final String note;
  final int localTeamId;
  final int visitorTeamId;
  final String localTeamImage;
  final String visitorTeamImage;
  final String localTeamName;
  final String visitorTeamName;
  final String startAt;

  final String round, name;

  EventsModel({
    this.id,
    // this.name,
    this.type,
    this.status,
    this.localTeamId,
    this.visitorTeamId,
    this.localTeamScore,
    this.localTeamWicket,
    this.note,
    this.visitorTeamWicket,
    this.visitorTeamScore,
    this.localTeamImage,
    this.visitorTeamImage,
    this.localTeamName,
    this.visitorTeamName,
    this.startAt,
    this.round,
    this.name
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
        id: json['id'],
        // name:json['name'],
        note: json['note'] ?? "",
        type: json['type'] ?? "",
        status: json['status'] ?? "",
        localTeamId: json['localteam_id'],
        localTeamScore: (json['localteam_dl_data'] ?? {})['score'] ?? "",
        localTeamWicket: (json['localteam_dl_data'] ?? {})['wickets_out'] ?? "",
        visitorTeamId: json['visitorteam_id'],
        visitorTeamWicket:
            (json['visitorteam_dl_data'] ?? {})['wickets_out'] ?? "",
        visitorTeamScore: (json['visitorteam_dl_data'] ?? {})['score'] ?? "",
        localTeamImage: (json["localteam"] ?? {})['image_path'] ?? "",
        visitorTeamImage: (json["visitorteam"] ?? {})['image_path'] ?? "",
        localTeamName: (json["localteam"] ?? {})['name'] ?? "",
        visitorTeamName: (json["visitorteam"] ?? {})['name'] ?? "",
        startAt: json['starting_at']?? "",
        name:(json['stage']?? {})['name'] ?? "",
        round: json['round']?? "",
        
        );
  }
}
