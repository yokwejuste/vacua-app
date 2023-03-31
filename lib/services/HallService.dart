import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:vacua_app/main.dart';
import 'package:vacua_app/models/halls.dart';

class HallService {
  final _dio =
      Dio(BaseOptions(baseUrl: "http://157.230.108.191/v1/api/console"));
  final WidgetRef ref;

  HallService({required this.ref}) {
    _dio.options.headers['Authorization'] =
        'Bearer ${ref.read(userProvider)!.token}';
  }

  Future<List<dynamic>> getHall() async {
    try {
      Response res = await _dio.get("/halls/");
      final rhalls = await res.data;
      List<Halls> hls = [];
      rhalls.forEach((h) {
        hls.add(Halls.fromJson(h));
      });
      return hls;
    } on DioError catch (e) {
      print(e);
      throw Exception("There was problem getting halls");
    } catch (e) {
      print(e.toString());
      throw Exception("An error occured");
    }
  }

  Future<List<dynamic>> getOccupiedHalls() async {
    try {
      Response res = await _dio.get("/halls/occupied_halls");
      final rhalls = await res.data;
      List<Halls> hls = [];
      rhalls.forEach((h) {
        hls.add(Halls.fromJson(h));
      });
      return hls;
    } on DioError catch (e) {
      print(e);
      throw Exception("There was problem getting halls");
    } catch (e) {
      print(e.toString());
      throw Exception("An error occured");
    }
  }
}
