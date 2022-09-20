import 'package:cric_dice/screens/webview.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NewsDetails extends StatelessWidget {
  final data;
  final id;

  NewsDetails({@required this.data, @required this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context);
    final _paddingTop = mSize.padding.top;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: mSize.size.height / 3,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: Stack(
                children: [
                  Hero(
                    tag: id.toString(),
                    child: Image(
                      width: double.infinity,
                      height: double.infinity,
                      image: NetworkImage(data.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: _paddingTop + 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CardBackNews(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ShakeTransition(
                  duration: Duration(milliseconds: 900),
                  child: Text(
                    data.author != null ? data.author : 'Cric Dice',
                    style: theme.textTheme.headline4.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ShakeTransition(
                  duration: Duration(milliseconds: 1200),
                  child: Text(
                    data.title,
                    style: theme.textTheme.headline2
                        .copyWith(fontSize: 28, height: 1.25),
                  ),
                ),
                SizedBox(height: 20.0),
                ShakeTransition(
                  duration: Duration(milliseconds: 1600),
                  axis: Axis.vertical,
                  child: Text(
                    data.body,
                    style: theme.textTheme.bodyText1.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                    child: Html(
                  data: data.content.toString(),
                  tagsList: [],
                )
                    // child: TextButton(
                    //   onPressed: () {
                    //     Get.to(() => WebViewExample(url: data.url));
                    //   },r
                    //   child: Text(
                    //     'Read Full Story',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   style: ButtonStyle(
                    //     backgroundColor:
                    //         MaterialStateProperty.all<Color>(theme.primaryColor),
                    //   ),
                    // ),
                    )
                // ShakeTransition(
                //   duration: Duration(milliseconds: 1800),
                //   axis: Axis.vertical,
                //   child: Text(
                //     getTranslated(context, 'recent_news'),
                //     style: theme.textTheme.headline1.copyWith(
                //       color: theme.primaryColor,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10.0),
                // Column(
                //   children: [
                //     for (int i = 0; i < 3; i++)
                //       ShakeListTransition(
                //         duration: Duration(milliseconds: (i + 3) * 300),
                //         axis: Axis.vertical,
                //         child: CardLatestNews(
                //           id: id,
                //           title: NewsApi.aListNews[i].title,
                //           image: NewsApi.aListNews[i].image,
                //           category: NewsApi.aListNews[i].category,
                //           onTap: () {
                //             //TODO: open News
                //           },
                //         ),
                //       ),
                //   ],
                // ),
                // SizedBox(height: 10.0),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class CardBackNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                theme.primaryColor,
                theme.primaryColorDark,
              ]),
        ),
        padding: EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.chevronLeft,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }
}
