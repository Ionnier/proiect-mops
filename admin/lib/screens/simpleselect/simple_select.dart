import 'package:admin/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

class SimpleSelect extends StatefulWidget {
  const SimpleSelect({super.key, required this.endpoint});
  final String endpoint;
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
      dio.get(widget.endpoint).then((result) {
        try {
          if (result.statusCode != 200) {
            throw Exception("Status code ${result.statusCode}");
          }
          setState(() {
            isLoading = false;
            try {
              data = result.data["_embedded"][widget.endpoint.split("/").last];
              for (var element in (data as List<dynamic>)) {
                (element as Map<String, dynamic>).remove("_links");
              }
            } on Exception {
              setState(() {
                isLoading = false;
                errorMessage = "error";
              });
            }
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
