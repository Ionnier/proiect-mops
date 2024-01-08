import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:front/data/settings.dart';
import 'package:front/models/desk.dart';
import 'package:provider/provider.dart';

class DeskListItem extends StatelessWidget {
  final Desk desk;
  const DeskListItem({super.key, required this.desk});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Desk ${desk.id}"),
        Consumer<BaseCacheManager>(builder: (context, cacheManager, child) {
          return CachedNetworkImage(
            imageUrl: Settings.baseUrl.replaceAll("/api", "") + desk.location,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 128,
            height: 128,
            cacheManager: cacheManager,
          );
        }),
      ],
    );
  }
}
