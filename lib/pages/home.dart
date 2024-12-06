import 'dart:convert';
import 'package:Wajibika/models/home_data.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/widgets/countup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<HomeData> getHomePageData() async {
    final url = Uri.parse("http://127.0.0.1:8000/api/home");
    final response = await http.get(url);
    late final dynamic responseData;
    if (response.statusCode == 200) {
      responseData = json.decode(response.body);
      print(responseData);
    }
    return HomeData.fromJson(responseData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeData>(
      future: getHomePageData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final homeData = snapshot.data!;

          return Center(
            child: Column(
              children: [
                //OAG audit
                SizedBox(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      //source
                      Text(
                        "source: ${homeData.mdaTitle}",
                        style: const TextStyle(
                            fontSize: 11,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 8)),
                      //title
                      Text(
                        homeData.mdaTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: globals.titleFontSize),
                      ),
                      //number of projects
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          const SizedBox(
                              width: 185, child: Text('Projects in focus: ')),
                          Text(homeData.numberOfprojectsHighlightedmda
                              .toString()),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),

                      //contract amounts
                      Row(
                        children: [
                          const SizedBox(
                              width: 185,
                              child:
                                  Text('Total Cumulative Contract amounts: ')),
                          const Text('Kshs.  ',
                              style: TextStyle(color: Colors.green)),
                          CounterUpWidget(
                              end: double.parse(
                                  homeData.cumulativeContractsAmount),
                              color: Colors.green)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      //amounts paid
                      Row(
                        children: [
                          const SizedBox(
                              width: 185,
                              child: Text('Total Cumulative Amounts Paid: ')),
                          const Text('Kshs.  ',
                              style: TextStyle(color: Colors.red)),
                          CounterUpWidget(
                              end: double.parse(homeData.cumulativeAmountsPaid),
                              color: Colors.red)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      //as of
                      Row(
                        children: [
                          const SizedBox(width: 185, child: Text('As of: ')),
                          Text(homeData.asOfDatemda)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/mda-projects');
                              },
                              child: Text('More details')),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
                //Citizen Audit
                SizedBox(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      //source
                      Text(
                        "source: ${homeData.sourceCtz}",
                        style: const TextStyle(
                            fontSize: 11,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 8)),
                      //title
                      Text(
                        homeData.ctzTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: globals.titleFontSize),
                      ),
                      //number of projects
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          const SizedBox(
                              width: 190, child: Text('Projects in focus: ')),
                          Text(homeData.projectsHighlightedctz.toString()),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      //approximate taxpayer money lost
                      Row(
                        children: [
                          const SizedBox(
                              width: 185,
                              child: Text(
                                  'Approximate Value of Taxpayer money Lost: ')),
                          const Text('Kshs.  ',
                              style: TextStyle(color: Colors.red)),
                          CounterUpWidget(
                              end: double.parse(
                                  homeData.approximateValueofTaxpayermoneyLost),
                              color: Colors.red)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      //as of
                      Row(
                        children: [
                          const SizedBox(width: 185, child: Text('As of: ')),
                          Text(homeData.asOfctz)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/citizen-audited-projects');
                              }, child: const Text('More details')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('Unexpected error');
        }
      },
    );
  }
}