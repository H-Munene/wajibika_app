class StateDepartment {
  final String stateDepartmentName;
  final String cumulativeContractAmounts;
  final String cumulativeAmountPaid;
  final Map<String, List> projects;

  StateDepartment(
      {required this.stateDepartmentName,
      required this.cumulativeContractAmounts,
      required this.cumulativeAmountPaid,
      required this.projects});

  // factory StateDepartment.fromJson(Map<String, dynamic> json) {
  // return StateDepartment(
  //   stateDepartmentName : json['stateDepartment'],
  //   cumulative_contract_amounts:  : json['cumulative Contract Amounts (Kshs.)'],
  //   cumulative_amountPaid :json['cumulative AmountPaid'],
  //   projects : json['projects'],
  // );
//}
  factory StateDepartment.fromJson(Map<String, dynamic> json) {
    return StateDepartment(
      stateDepartmentName: json['stateDepartment'],
      cumulativeContractAmounts:
          json['cumulative Contract Amounts (Kshs.)'].toString(),
      cumulativeAmountPaid: json['cumulative AmountPaid'].toString(),
      projects: json['projects'],
    );
  }
}
