import 'package:flutter/material.dart';
import 'package:front/data/desk_repository.dart';
import 'package:front/ui/desk_screen/desk_screen_item.dart';
import 'package:provider/provider.dart';

class DeskScreen extends StatelessWidget {
  const DeskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DeskRepository>(builder: (context, repository, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Desks"),
        ),
        body: FutureBuilder(
            future: repository.getDesks(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView(
                        children: (snapshot.data ?? [])
                            .map((e) => Row(children: [
                                  const Spacer(),
                                  DeskListItem(
                                    desk: e,
                                    showImage: true,
                                  ),
                                  const Spacer()
                                ]))
                            .toList());
                  }
              }
            }),
      );
    });
  }
}
