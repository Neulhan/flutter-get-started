import 'package:flutter/material.dart';
import 'package:http_started/src/models/webtoon_detail_model.dart';
import 'package:http_started/src/models/webtoon_episode_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/episode_widget.dart';
import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonModel webtoon;
  const DetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late WebtoonModel webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late Future<WebtoonDetailModel> detail;
  late SharedPreferences prefs;

  bool isFavorite = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    var data = prefs.getBool('isFavorite-${webtoon.id}');
    isFavorite = data ?? false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    webtoon = widget.webtoon;
    episodes = ApiService().getWebtoonEpisodesById(webtoon.id);
    detail = ApiService().getWebtoonDetail(webtoon.id);
    initPrefs();
  }

  onPressFavorite() async {
    isFavorite = !isFavorite;
    prefs.setBool('isFavorite-${webtoon.id}', isFavorite);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.webtoon.title,
        ),
        actions: [
          IconButton(
            onPressed: onPressFavorite,
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Hero(
              tag: widget.webtoon.id,
              child: SizedBox(
                height: 240,
                child: Image(
                  image: NetworkImage(widget.webtoon.thumb),
                ),
              ),
            ),
            FutureBuilder(
              future: detail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data!.genre,
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            snapshot.data!.age,
                            style: const TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text("LOADING");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      for (var epi in snapshot.data!)
                        EpisodeWidget(
                          epi: epi,
                          webtoonId: webtoon.id,
                        )
                    ],
                  );
                } else {
                  return const Text("LOADING");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
