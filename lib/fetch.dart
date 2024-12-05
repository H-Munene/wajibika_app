// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// List<Goal> goals = [];
// Future<void> fetchGoals() async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString("auth_token");

//   if(token == null) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not authenticated')));
//     return ;
//   }else {
//     //final url = Uri.parse(...)
//     //final response = await http.get(url, headers : {
//       'Authorization' : 'Bearer $token',
//       if( response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         setstate() {
//           (goals = (responseData['goals'] as List).map((goal) => Goal.fromJson(goal).toList();).toList() //from response body

//         }

//       }

//     });
    
//   }
// }


// void initState() {
//   super.initState();
//   fetchGoals();
// }
// Widget build(BuildContext context){
//   returN Scaffold {
//     body : _isLoading ? Center(child: 
//     CircularProgressIndicator(),) : goals.isEmpty? Text('Goals not found') : 
//       ListView.builder(
//         itemCount: goals.length,
//         itemBuilder: (context, index) {
//           final goal = goals[index],
//           return Card(
//             child: Column(
//               children: [
//                 Text("${goal.description}"),
//                 Text('${goal.viewdate}'), //defined in model
//               ],
//             ),
//           )
//         })
//   }
// }