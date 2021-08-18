import 'package:flutter/cupertino.dart';

class EventsModel {
 final int id;
 final String name;
 final String type;
 final String status;
 final String localTeamScore;
 final String localTeamWicket;
 final String visitorlTeamScore;
 final String visitorTeamWicket;
 final String note;
 final int localTeamId;
 final int visitorTeamId;
 final String localTeamImage;
 final String visitorTeamImage;


  EventsModel({this.id,
    this.name,
    this.type,
    this.status,
    this.localTeamId,
    this.visitorTeamId,
    this.localTeamScore,
    this.localTeamWicket, 
    this.note,
    this.visitorTeamWicket,
    this.visitorlTeamScore, 
    this.localTeamImage, this.visitorTeamImage
    
  });

  factory EventsModel.fromJson(Map<String, dynamic> json){
    return EventsModel(
      id: json['id'],
      name:json['name'],
      note: json['note'],
      type:json['type'],
      status: json['status'],
      localTeamId: json['localteam_id'],
      localTeamScore: json['localteam_dl_data']['score'],
      localTeamWicket: json['localteam_dl_data']['wickets_out'],
      visitorTeamId: json['visitorteam_id'],
      visitorTeamWicket: json['visitorteam_dl_data']['wickets'],
      visitorlTeamScore: json['visitorteam_dl_data']['score'],
      localTeamImage: json['image_path'],
      visitorTeamImage: json['image_path']

    );
  }
}
