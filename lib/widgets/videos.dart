import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:timeago/timeago.dart' as timeago;

class Video extends StatelessWidget {
  const Video({Key? key, required this.video}) : super(key: key);

  final Map video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          video["snippet"]["thumbnails"]["medium"]["url"],
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    video["snippet"]["thumbnails"]["medium"]["url"]),
                radius: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video["snippet"]["title"],
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${video["snippet"]["channelTitle"]} • ${Numeral(int.parse(video["statistics"]["viewCount"]))} views • ${timeago.format(DateTime.parse(video["snippet"]["publishedAt"]))}",
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
