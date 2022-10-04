import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/screens/match_details/series_details.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SeriesList extends StatefulWidget {
  @override
  State<SeriesList> createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {
  final networkHandler = new NetworkHandler();
  var response;
  var isLoading = false;
  void getData() async {
    isLoading = true;
    response = await networkHandler.get('/get_serieslist');
    isLoading = false;
    response = await response['data'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
        appBar: AppBar(
          title: ShakeTransition(
            duration: Duration(milliseconds: 1600),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.baseballBall,
                  size: 22.0,
                  color: theme.accentColor,
                ),
                SizedBox(width: 5.0),
                Text(
                  'Latest Series',
                  style: theme.textTheme.headline1.copyWith(
                    color: theme.accentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: response != null
            ? Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                    child: ListView.builder(
                        itemCount: int.parse('${response.length}'),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            ShakeListTransition(
                                duration: Duration(milliseconds: 1000),
                                child: SeriesCard(
                                  data: response[index],
                                  onTap: () {
                                    Get.to(() => SeriesDetails(
                                          id: response[index]['series_id'],
                                          seriesName: response[index]['series']
                                              .toString(),
                                        ));
                                  },
                                )),
                            SizedBox(
                              height: 20.0,
                            )
                          ]);
                        })))
            : Center(child: Text('No data found')));
  }
}

class SeriesCard extends StatelessWidget {
  final data;
  final onTap;
  SeriesCard({this.data, this.onTap});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              data['image'].toString() ??
                                  "https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png",
                              width: 30,
                              height: 30),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Text(
                            data['series'].toString() ?? "N.A.",
                            style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 16,
                                height: 1.2,
                                color: theme.accentColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 2),
                          child: Text(
                            'Total Matches:',
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              color: theme.accentColor,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Container(
                            child: Text(
                              data['total_matches'].toString() ?? "0",
                              style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 14,
                                height: 1.2,
                                color: theme.accentColor,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Divider(height: 8, color: Colors.black),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Text(
                            'Series Date :',
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              color: theme.accentColor,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Container(
                            width: 200,
                            child: Row(
                              children: [
                                Text(
                                  data['series_date'].toString() ?? "N.A.",
                                  style: theme.textTheme.bodyText2.copyWith(
                                    fontSize: 14,
                                    height: 1.2,
                                    color: theme.accentColor,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
