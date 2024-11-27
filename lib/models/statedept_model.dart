import 'package:Wajibika/models/projects_model.dart';

class StateDepartment {
  final String stateDepartmentName;
  final String cumulativeContractAmounts;
  final String cumulativeAmountPaid;
  final dynamic projects;

  StateDepartment(
      {required this.stateDepartmentName,
      required this.cumulativeContractAmounts,
      required this.cumulativeAmountPaid,
      required this.projects});

  factory StateDepartment.fromJson(Map<String, dynamic> json) {
    var projects = json['projects'] as List;
    List<Project> projectList = projects.map((project) {
      return Project.fromJson(project);
    }).toList();

    return StateDepartment(
      stateDepartmentName: json['stateDepartment'],
      cumulativeContractAmounts:
          json['cumulative Contract Amounts (Kshs.)'].toString(),
      cumulativeAmountPaid: json['cumulative AmountPaid'].toString(),
      projects: projectList,
    );
  }
}