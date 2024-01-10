import 'package:admin/data/auth_repository.dart';
import 'package:admin/screens/simpleselect/simple_select.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class RentalScreen extends StatefulWidget {
  final AuthRepository authRepository = AuthRepository();
  RentalScreen({super.key});

  @override
  State<RentalScreen> createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  bool _isLoading = false;
  String? errorMessage;
  Key key = const Key("sad");

  @override
  Widget build(BuildContext context) {
    var inputs = [
      "inventoryId",
      "userId",
      "createdAt",
      "state (PREPARING, AWAITING_PICK_UP, RENTED, RETURNED)"
    ];
    var controllers = inputs.map((e) => (e, TextEditingController())).toList();
    List<Widget> items = [];
    for (var e in controllers) {
      items.add(TextField(
        decoration: InputDecoration(label: Text(e.$1)),
        controller: e.$2,
      ));
      items.add(const SizedBox(
        height: 4,
      ));
    }
    items.add(const SizedBox(
      height: 4,
    ));

    if (_isLoading) {
      items.add(const Center(
        child:
            SizedBox(height: 24, width: 24, child: CircularProgressIndicator()),
      ));
    } else {
      items.add(Row(
        children: [
          const Spacer(),
          TextButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                  errorMessage = null;
                });
                final error = await widget.authRepository.updateRentedBook(
                    int.parse(controllers[0].$2.text),
                    int.parse(controllers[1].$2.text),
                    int.parse(controllers[2].$2.text),
                    controllers[3].$2.text);
                setState(() {
                  _isLoading = false;
                });
                if (error == null) {
                  for (var element in controllers) {
                    element.$2.text = "";
                  }
                  setState(() {
                    key = Key(const Uuid().v4());
                  });
                  return;
                }
                setState(() {
                  errorMessage = error;
                });
              },
              child: const Text("Submit")),
          const Spacer(),
        ],
      ));
    }
    if (errorMessage != null) {
      items.add(Text(errorMessage!));
    }
    items.add(SimpleSelect(
      key: key,
      endpoint: "/data/rentals",
      linksKeeper: const [],
      prelucrateEmbedded: false,
      onRowSelect: (int index, map) {
        final Map<String, dynamic> newMap = (map as Map<String, dynamic>)["id"];
        controllers[0].$2.text = newMap["inventoryId"].toString();
        controllers[1].$2.text = newMap["userId"].toString();
        controllers[2].$2.text = newMap["createdAt"].toString();
        controllers[3].$2.text = (map)["state"];
      },
    ));
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: items,
      ),
    );
  }
}
