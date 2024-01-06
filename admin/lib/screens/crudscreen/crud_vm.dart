import 'dart:io';

import 'package:admin/data/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CrudVM extends ChangeNotifier {
  final AuthRepository _authRepository;
  final String endpoint;
  List<String> properties = List.empty();
  bool isLoading = false;
  String? errorMessage;
  String? message;

  CrudVM(this.endpoint, {required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> makeRequest(String method, Map<String, dynamic> data) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    message = null;
    notifyListeners();
    final dio = _authRepository.provideDio();
    try {
      String? id;
      for (var element in data.entries) {
        if (element.key.toLowerCase().contains("id")) {
          id = element.value;
        }
      }
      if (method == "DELETE") {
        String? id;
        for (var element in data.entries) {
          if (element.key.toLowerCase().contains("id")) {
            id = element.value;
          }
        }
        if (id == null) {
          throw Exception("Could not find id for delete method");
        }
        var response = await dio.delete("$endpoint/$id");
        if (response.statusCode != HttpStatus.noContent) {
          throw Exception(
              "Received status code ${response.statusCode} on Delete");
        } else {
          message = "Executed";
        }
        isLoading = false;
        return;
      }
      Response<dynamic>? response;
      if (method == "POST") {
        response = await dio.post(endpoint, data: data);
      }
      if (method == "PUT") {
        response = await dio.put("$endpoint/$id", data: data);
      }
      if (response!.statusCode != HttpStatus.accepted ||
          response.statusCode != HttpStatus.created) {
        throw Exception("Received ${response.statusCode}");
      }
      isLoading = false;
      message = "Executed";
    } on Exception catch (e) {
      errorMessage = e.toString();
      isLoading = false;
    }
    notifyListeners();
  }
}
