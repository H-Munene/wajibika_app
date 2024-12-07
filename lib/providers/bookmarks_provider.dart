import 'package:Wajibika/models/citizen_audit_model.dart';
import 'package:Wajibika/models/statedept_model.dart';
import 'package:flutter/material.dart';

class BookmarksProvider extends ChangeNotifier {
  final List<StateDepartment> _statedepartments = [];
  final List<CitizenAuditData> _citizenAuditedProjects = [];

  //getters
  List<StateDepartment> get stateDepartments => _statedepartments;
  List<CitizenAuditData> get citizenAuditData => _citizenAuditedProjects;

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

  //determine if a statedepartment has been bookmarked
  bool isBookmarked(StateDepartment stateDepartment) {
    return _statedepartments.contains(stateDepartment);
  }

   void toggleCtzBookmark(CitizenAuditData citizenAuditData) {
    //ascertain if present in list
    final ctzisBookmarked = _citizenAuditedProjects.contains(citizenAuditData);
    if(ctzisBookmarked) {
      //remove if present
      _citizenAuditedProjects.remove(citizenAuditData);
    }else {
      //add if absent
      _citizenAuditedProjects.add(citizenAuditData);
    }

    notifyListeners();
  }

  //determine if a statedepartment has been bookmarked
  bool ctzisBookmarked(CitizenAuditData citizenAuditData) {
    return _citizenAuditedProjects.contains(citizenAuditData);
  }
}
