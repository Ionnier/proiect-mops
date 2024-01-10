import 'package:flutter/material.dart';
import 'package:front/data/desk_repository.dart';
import 'package:front/models/desk.dart';
import 'package:front/ui/desk_screen/desk_book_content.dart';
import 'package:provider/provider.dart';

class DeskBookScreen extends StatefulWidget {
  final Desk desk;
  final bool showImage;
  const DeskBookScreen(
      {super.key, required this.desk, required this.showImage});

  @override
  State<DeskBookScreen> createState() => _DeskBookScreenState();
}

class _DeskBookScreenState extends State<DeskBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DeskRepository>(builder: (context, repository, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Desks"),
            leading: BackButton(onPressed: () {
              Navigator.maybePop(context);
            }),
          ),
          body: FutureBuilder(
              future: repository.getDeskDetails(widget.desk),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    if (snapshot.hasError || snapshot.data == null) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return DeskBookContent(
                        deskDetails: snapshot.data!,
                        showImage: widget.showImage,
                      );
                    }
                }
              }));
    });
  }
}
