class OagHome {
  final String source;
  final String numberOfprojectsHighlighted;
  final String cumulativeContractsAmount;
  final String cumulativeAmountsPaid;
  final String asOfDate;

  OagHome(
      {required this.source,
      required this.numberOfprojectsHighlighted,
      required this.cumulativeContractsAmount,
      required this.cumulativeAmountsPaid,
      required this.asOfDate});

  factory OagHome.fromJson(Map<String, dynamic> json) {
    return OagHome(
        source:json['source'],
        numberOfprojectsHighlighted: json['projectsHighlighted'],
        cumulativeContractsAmount:
            json['totalcumulativeContractsAmount(Kshs.)'],
        cumulativeAmountsPaid: json['totalcumulativeAmountsPaid (Kshs.)'],
        asOfDate: json['asOf']);
  }
}