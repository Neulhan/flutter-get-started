import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/webtoon_episode_model.dart';

class EpisodeWidget extends StatelessWidget {
  final WebtoonEpisodeModel epi;
  final String webtoonId;

  const EpisodeWidget({
    Key? key,
    required this.epi,
    required this.webtoonId,
  }) : super(key: key);

  onPressed() async {
    await launchUrlString(
        'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${epi.id}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Image(
                image: NetworkImage(epi.thumb),
                width: 80,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6, left: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(epi.title),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.black45,
                            size: 14,
                          ),
                          Text(
                            epi.rating,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            epi.date,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
