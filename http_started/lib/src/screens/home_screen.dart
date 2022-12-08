import 'package:flutter/material.dart';
import 'package:http_started/src/components/webtoon_grid_item.dart';

import '../components/app_bar.dart';
import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Future<List<WebtoonModel>> webtoons = ApiService().getTodaysWebtoons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DemoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return makeGrid(snapshot);
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  GridView makeGrid(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: <Widget>[
        for (var webtoon in snapshot.data!) WebtoonGridItem(webtoon: webtoon),
      ],
    );
  }
}
