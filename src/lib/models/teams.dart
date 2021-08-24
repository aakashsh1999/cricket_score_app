import 'dart:convert';

class TeamsModel {
  final id;
  final logo;
  final String name;
  bool picked;

  TeamsModel({
    this.id,
    this.logo,
    this.name,
    // this.picked = false,
  });



  factory TeamsModel.fromJson(Map<String, dynamic> map) {
    return TeamsModel(
      name: map['name'],
      // picked: map['picked'],
      id: map['id'],
      logo:map['image_path']
    );
  }


}
