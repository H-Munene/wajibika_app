class HomeData {
  final String approximateValueofTaxpayermoneyLost;
  final int projectsHighlightedctz;
  final String sourceCtz;
  final String asOfctz;
  final String sourcemda;
  final int numberOfprojectsHighlightedmda;
  final String cumulativeContractsAmount;
  final String cumulativeAmountsPaid;
  final String asOfDatemda;
  final String mdaTitle;
  final String ctzTitle;

  HomeData(
      {required this.sourcemda,
      required this.numberOfprojectsHighlightedmda,
      required this.cumulativeContractsAmount,
      required this.cumulativeAmountsPaid,
      required this.asOfDatemda,
      required this.approximateValueofTaxpayermoneyLost,
      required this.projectsHighlightedctz,
      required this.sourceCtz,
      required this.asOfctz,
      required this.mdaTitle,
      required this.ctzTitle
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
        mdaTitle: json['mda_title'],
        ctzTitle: json['ctz_title']
        );
  }
}