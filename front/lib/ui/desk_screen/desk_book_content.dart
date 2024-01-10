import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:front/data/desk_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/models/desk.dart';
import 'package:front/models/deskdetails.dart';
import 'package:front/ui/desk_screen/interval_companion.dart';
import 'package:provider/provider.dart';

class DeskBookContent extends StatefulWidget {
  final DeskDetails deskDetails;
  final bool showImage;
  const DeskBookContent(
      {super.key, required this.deskDetails, required this.showImage});

  @override
  State<DeskBookContent> createState() => _DeskBookContentState();
}

class _DeskBookContentState extends State<DeskBookContent> {
  List<IntervalCompanion> intervals = List.empty();
  DateTime selectedDate = DateTime.now();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    intervals = _generateIntervals(DateTime.now(), widget.deskDetails.desk);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeskRepository>(
      builder: (context, repository, child) => SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Desk ${widget.deskDetails.desk.id}"),
              const SizedBox(
                height: 4,
              ),
              if (widget.showImage)
                Consumer<BaseCacheManager>(
                    builder: (context, cacheManager, child) {
                  return CachedNetworkImage(
                    imageUrl: Settings.baseUrl.replaceAll("/api", "") +
                        widget.deskDetails.desk.location,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: 128,
                    height: 128,
                    cacheManager: cacheManager,
                  );
                }),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                      onPressed: (isSameDay(DateTime.now()))
                          ? null
                          : () => {incrementDate(false)},
                      icon: const Icon(
                        Icons.arrow_back,
                        semanticLabel: "asd",
                      )),
                  Text(selectedDate.toString().split(" ")[0]),
                  IconButton(
                      onPressed: () {
                        incrementDate(true);
                        void rebuild(Element el) {
                          el.markNeedsBuild();
                          el.visitChildren(rebuild);
                        }

                        (context as Element).visitChildren(rebuild);
                      },
                      icon: const Icon(Icons.arrow_forward)),
                  const Spacer(),
                ],
              ),
              Wrap(
                  children: intervals
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(4),
                            child: FilterChip(
                              selected: !e.isOccupied && e.isSelected,
                              label: Text("${e.startHour} - ${e.endHour}"),
                              onSelected: !e.isOccupied
                                  ? (newValue) {
                                      selectInterval(e);
                                    }
                                  : null,
                              showCheckmark: false,
                              disabledColor: e.isOccupied
                                  ? Theme.of(context).colorScheme.error
                                  : null,
                            ),
                          ))
                      .toList()),
              const SizedBox(
                height: 4,
              ),
              if (intervals.any((element) => element.isSelected))
                ElevatedButton(
                    onPressed: () async {
                      var string = await repository.book(
                          intervals
                              .where((element) => element.isSelected)
                              .map((e) => e.toInterval())
                              .toList(),
                          widget.deskDetails.desk);
                      const duration = Duration(milliseconds: 500);
                      var snackBar = SnackBar(
                        content: Text(string ?? "Success"),
                        duration: duration,
                      );
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(duration, () => {Navigator.pop(context)});
                    },
                    child: const Text("Book")),
              const Spacer(),
            ],
          )),
    );
  }

  bool isSameDay(DateTime date) {
    return selectedDate
        .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0)
        .isAtSameMomentAs(date.copyWith(
            hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0));
  }

  void incrementDate(bool foward) {
    setState(() {
      if (foward) {
        selectedDate = selectedDate.add(const Duration(days: 1));
      } else {
        selectedDate = selectedDate.subtract(const Duration(days: 1));
      }
      intervals = _generateIntervals(selectedDate, widget.deskDetails.desk);
    });
  }

  List<IntervalCompanion> _generateIntervals(DateTime currentDate, Desk desk) {
    var intervals = List.generate(12, (index) => index + 1).map((e) {
      var interval = IntervalCompanion();
      interval.startHour = e + 8;
      interval.endHour = interval.startHour + 1;
      interval.date = currentDate;
      return interval;
    }).toList();
    final moment =
        DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch;
    for (var element in intervals) {
      var intervalStartTimestamp = DateTime(currentDate.year, currentDate.month,
              currentDate.day, element.startHour)
          .millisecondsSinceEpoch;
      var intervalEndTimestamp = DateTime(currentDate.year, currentDate.month,
              currentDate.day, element.endHour)
          .millisecondsSinceEpoch;

      if (intervalStartTimestamp - moment < 0 &&
          intervalEndTimestamp - moment < 0 &&
          isSameDay(element.date)) {
        element.isOccupied = true;
        continue;
      }
      for (var reserved in widget.deskDetails.reservedIntervals) {
        if (reserved.startTimestamp - intervalStartTimestamp > 0 &&
            reserved.startTimestamp - intervalEndTimestamp > 0) {
          continue;
        }
        if (intervalStartTimestamp - reserved.endTimestamp > 0 &&
            intervalEndTimestamp - reserved.endTimestamp > 0) {
          continue;
        }
        element.isOccupied = true;
      }
    }
    return intervals;
  }

  void selectInterval(IntervalCompanion interval) {
    setState(() {
      for (var el in intervals) {
        if (interval.startHour == el.startHour) {
          el.isSelected = !el.isSelected;
          break;
        }
      }
    });
  }
}
