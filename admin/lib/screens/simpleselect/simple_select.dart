import 'package:admin/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

class SimpleSelect extends StatefulWidget {
  const SimpleSelect(
      {super.key, required this.endpoint, required this.linksKeeper});
  final String endpoint;
  final List<String> linksKeeper;
  @override
  State<SimpleSelect> createState() => _SimpleSelectState();
}

class _SimpleSelectState extends State<SimpleSelect> {
  bool isLoading = false;
  String? errorMessage;
  dynamic data = Map.of({});
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    var dio = AuthRepository().provideDio();
    try {
      dio.get(widget.endpoint).then((result) async {
        try {
          if (result.statusCode != 200) {
            throw Exception("Status code ${result.statusCode}");
          }
          var newData =
              result.data["_embedded"][widget.endpoint.split("/").last];
          for (var element in (newData as List<dynamic>)) {
            if (element is Map<String, dynamic>) {
              for (var link in widget.linksKeeper) {
                element[link] =
                    (await dio.get(element["_links"][link]["href"])).data;
                (element[link] as Map<String, dynamic>).remove("_links");
              }
              element.remove("_links");
            }
          }
          setState(() {
            isLoading = false;
            data = newData;
          });
        } on Exception catch (e) {
          setState(() {
            errorMessage = e.toString();
            isLoading = false;
          });
        }
      });
    } on Exception catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const CircularProgressIndicator()
        : errorMessage != null
            ? Text(errorMessage!)
            : (data as List<dynamic>).isNotEmpty
                ? JsonTable(data)
                : const SizedBox(
                    width: 16,
                  );
  }
}
