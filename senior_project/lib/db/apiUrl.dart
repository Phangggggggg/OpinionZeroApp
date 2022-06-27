import 'package:flutter/material.dart';

class ApiUrl {
  static const String baseUrl = 'http://127.0.0.1:8000';
  static const String addUserUrl = baseUrl + '/users/add';
  static const String authUserUrl = baseUrl + '/auth/';
  static const String retrieveUrl = baseUrl + '/articles/retrieve';
  static const String retrieveOpinionUrl = baseUrl + '/opinion/retrieve';
  static const String addOpinionUrl = baseUrl + '/news/addopinion';
  static const String filterNewsUrl = baseUrl + '/filter/filternews';
}
