class HomeData {
  final String approximateValueofTaxpayermoneyLost;
  final String projectsHighlightedctz;
  final String sourceCtz;
  final String asOfctz;
  final String sourcemda;
  final String numberOfprojectsHighlightedmda;
  final String cumulativeContractsAmount;
  final String cumulativeAmountsPaid;
  final String asOfDatemda;

  HomeData(
      {required this.sourcemda,
      required this.numberOfprojectsHighlightedmda,
      required this.cumulativeContractsAmount,
      required this.cumulativeAmountsPaid,
      required this.asOfDatemda,
      required this.approximateValueofTaxpayermoneyLost,
      required this.projectsHighlightedctz,
      required this.sourceCtz,
      required this.asOfctz
      });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
        sourcemda:json['source_mda'],
        numberOfprojectsHighlightedmda: json['projectsHighlightedmda'],
        cumulativeContractsAmount:
            json['totalcumulativeContractsAmount(Kshs.)'],
        cumulativeAmountsPaid: json['totalcumulativeAmountsPaid (Kshs.)'],
        asOfDatemda: json['asOfmda'],
        approximateValueofTaxpayermoneyLost: json['ApproximateValueofTaxpayermoneyLost(Kshs.)'],
        projectsHighlightedctz: json['projectsHighlightedctz'],
        sourceCtz: json['source_ctz'],
        asOfctz: json['asOfctz'],
        );
  }
}