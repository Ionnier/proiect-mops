import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:front/data/settings.dart';
import 'package:front/models/desk.dart';
import 'package:front/ui/desk_screen/desk_book_screen.dart';
import 'package:provider/provider.dart';

class DeskListItem extends StatelessWidget {
  final Desk desk;
  final bool showImage;
  const DeskListItem({super.key, required this.desk, required this.showImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Text("Desk ${desk.id}"),
          if (showImage)
            Consumer<BaseCacheManager>(builder: (context, cacheManager, child) {
              return CachedNetworkImage(
                imageUrl:
                    Settings.baseUrl.replaceAll("/api", "") + desk.location,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 128,
                height: 128,
                cacheManager: cacheManager,
              );
            }),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DeskBookScreen(
                    desk: desk,
                    showImage: showImage,
                  )),
        );
      },
    );
  }
}
