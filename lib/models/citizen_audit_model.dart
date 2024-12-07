class CitizenAuditData {
  final String countyName;
  final List<ProjectDetails> projects;

  CitizenAuditData({
    required this.countyName,
    required this.projects,
  });

  factory CitizenAuditData.fromJson(Map<String, dynamic> json) {
    return CitizenAuditData(
      countyName: json['County'],
      projects: (json['Projects'] as List)
          .map((projectJson) => ProjectDetails.fromJson(projectJson))
          .toList(),
    );
  }
}

class ProjectDetails {
  final String name;
  final String amountAllocated;
  final String amountPaid;
  final String status;

  ProjectDetails({
    required this.name,
    required this.amountAllocated,
    required this.amountPaid,
    required this.status,
  });

  factory ProjectDetails.fromJson(Map<String, dynamic> json) {
    return ProjectDetails(
      name: json['name'],
      amountAllocated: json['amount allocated'],
      amountPaid: json['amount paid'],
      status: json['status'],
    );
  }
}