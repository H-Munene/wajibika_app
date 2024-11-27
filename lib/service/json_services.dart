import 'dart:convert';

import 'package:Wajibika/models/projects_model.dart';
import 'package:Wajibika/models/statedept_model.dart';
import 'package:flutter/services.dart';


class JsonService {
 Future<List<StateDepartment>> getStateDepartments() async{
  final jsonSource = await rootBundle.loadString('assets/json.sample.json');
  var jsonData = json.decode(jsonSource) as List;

  return jsonData.map((statedpt) => StateDepartment.fromJson(statedpt)).toList();
 } 
}