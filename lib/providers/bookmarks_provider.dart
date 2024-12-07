import 'package:Wajibika/models/citizen_audit_model.dart';
import 'package:Wajibika/models/statedept_model.dart';
import 'package:flutter/material.dart';

class BookmarksProvider extends ChangeNotifier {
  final List<StateDepartment> _statedepartments = [];
  final List<CitizenAuditData> _citizenAuditedPeojects = [];

  //getters
  List<StateDepartment> get stateDepartments => _statedepartments;
  List<CitizenAuditData> get citizenAuditData => _citizenAuditedPeojects;

  void toggleBookmark(StateDepartment stateDepartment) {
    //ascertain if present in list
    final mdaisBookmarked = _statedepartments.contains(stateDepartment);
    if(mdaisBookmarked) {
      //remove if present
      _statedepartments.remove(stateDepartment);
    }else {
      //add if absent
      _statedepartments.add(stateDepartment);
    }

    notifyListeners();
  }
}
