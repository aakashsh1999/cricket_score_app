import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widget_match.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointsTable extends StatefulWidget {
  final id;

  PointsTable({this.id});

  @override
  State<PointsTable> createState() => _PointsTableState();
}

class _PointsTableState extends State<PointsTable> {
  final networkHandler = new NetworkHandler();
  var response;
  var isLoading = false;
  void getData() async {
    isLoading = true;
    response = await networkHandler.getBySId('/get_pointsTable', widget.id);
    isLoading = false;
    response = await response['data'];
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return !response.isEmpty
        ? Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  child: ListView.builder(
                      itemCount: int.parse('${response.length}'),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          ShakeListTransition(
                              duration: Duration(milliseconds: 1000),
                              child: PointsTableCard(data: response[index])),
                          SizedBox(
                            height: 20.0,
                          )
                        ]);
                      })),
            ),
          )
        : Center(child: Text('No data found'));
  }
}
