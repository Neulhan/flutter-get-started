import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_started/src/models/webtoon_detail_model.dart';

import '../models/webtoon_episode_model.dart';
import '../models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = 'webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  Future<List<WebtoonModel>> getTodaysWebtoons() async {
    List<WebtoonModel> webtoonInstances = [];
    var url = Uri.https(baseUrl, today);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (dynamic webtoon in webtoons) {
        var obj = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(obj);
      }

      return webtoonInstances;
    }
    throw Exception('Failed to load webtoons');
  }

  Future<WebtoonDetailModel> getWebtoonDetail(String id) async {
    var url = Uri.https(baseUrl, id);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(json);
    }
    throw Error();
  }

  Future<List<WebtoonEpisodeModel>> getWebtoonEpisodesById(String id) async {
    var url = Uri.https(baseUrl, '$id/episodes');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return [for (var epi in json) WebtoonEpisodeModel.fromJson(epi)];
    }
    throw Error();
  }
}
