import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointsTable extends StatefulWidget {
  final data;

  PointsTable({this.data});

  @override
  State<PointsTable> createState() => _PointsTableState();
}

class _PointsTableState extends State<PointsTable> {
  final networkHandler = new NetworkHandler();
  var response;
  void getData() async {
    response = await networkHandler.getById('/get_PointsTable', 1894);
    response = await response['data'];
    print(response);
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text('Hello');
  }
}
