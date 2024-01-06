import 'package:admin/data/auth_repository.dart';
import 'package:admin/screens/crudscreen/crud_vm.dart';
import 'package:admin/screens/simpleselect/simple_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrudScreen extends StatelessWidget {
  final String endpoint;
  final List<String> data;
  final List<String> supportiveEndpoints;

  const CrudScreen(
      {super.key,
      required this.endpoint,
      required this.data,
      required this.supportiveEndpoints});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                CrudVM(endpoint, authRepository: AuthRepository())),
      ],
      child: Consumer<CrudVM>(
        builder: (context, vm, child) {
          var controllers =
              data.map((e) => (e, TextEditingController())).toList();
          List<Widget> items = controllers.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(label: Text(e.$1)),
                    controller: e.$2,
                  )
                ],
              ),
            );
          }).toList();
          var newItems = List<Widget>.from(items);
          newItems.add(const SizedBox(
            height: 16,
          ));

          Map<String, dynamic> collectData() {
            return {
              for (var element in controllers) element.$1: element.$2.text
            };
          }

          newItems.add(ElevatedButton(
              onPressed: () {
                vm.makeRequest("POST", collectData());
              },
              child: const Text("Post")));
          newItems.add(const SizedBox(
            height: 4,
          ));
          newItems.add(ElevatedButton(
              onPressed: () {
                vm.makeRequest("PUT", collectData());
              },
              child: const Text("Put")));
          newItems.add(const SizedBox(
            height: 4,
          ));
          newItems.add(ElevatedButton(
              onPressed: () {
                vm.makeRequest("DELETE", collectData());
              },
              child: const Text("Delete")));

          if (vm.isLoading) {
            newItems.add(const SizedBox(
              height: 24,
              child: CircularProgressIndicator(),
            ));
          }
          if (vm.message != null) {
            newItems.add(Text(vm.message!));
          }
          if (vm.errorMessage != null) {
            newItems.add(Text(vm.errorMessage!));
          }

          for (var element in supportiveEndpoints) {
            newItems.add(SimpleSelect(endpoint: element));
          }
          return Scaffold(
            appBar: AppBar(),
            body: ListView(
              children: newItems,
            ),
          );
        },
      ),
    );
  }
}
