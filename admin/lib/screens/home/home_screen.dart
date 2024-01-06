import 'package:admin/screens/crudscreen/crud_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: ListView(children: [
        const SizedBox(
          height: 16,
        ),
        _createCard("Authors", "Edit authors", () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CrudScreen(
                      endpoint: "/data/authors",
                      data: ["authorId", "name"],
                      supportiveEndpoints: ["/data/authors"],
                    )),
          );
        }),
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }

  Widget _createCard(String title, String description, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(children: [
          Text(title),
          const SizedBox(
            width: 4,
          ),
          Text(description),
          const SizedBox(
            width: 4,
          ),
        ]),
      ),
    );
  }
}
