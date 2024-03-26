// import 'dart:convert';
// import 'dart:core';
// import 'package:afronex_task_1/features/wheather/data/models/weather_model.dart';
// import 'package:http/http.dart' as http;

// class DataService {
//   static const weather = 'weather';

//   Future<void> fetchData(String ) async {
//     // hive box token
//     await Hive.openBox<String>(tokenHive);


//     final String? token = Hive.box<String>(tokenHive).get('token');
//     // String token = prefs.getString('access_token') ?? '';
//     String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$location&APPID=4ebc4d4ca27bb7f37d53514a74ae6bee&units=metric';

//     print('ቶክኑ: $token');
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );

//       final responseData = json.decode(response.body);

//       if (responseData['status'] == true) {
//         /// ==== Vehicle List ==== ///
//         // Extract vehicle list
//         List<VehicleList> vehicleList =
//             (responseData['data']['vehicle_list'] as List)
//                 .map((data) => VehicleList.fromJson(data))
//                 .toList();
//         // Save vehicle list to Hive
//         await saveVehicleListToHive(vehicleList);

//         /// ==== destination List ==== ///
//         // Extract destination list
//         List<DestinationList> destinationList =
//             (responseData['data']['destination_list'] as List)
//                 .map((data) => DestinationList.fromJson(data))
//                 .toList();
//         // Save destination list to Hive
//         await saveDestinationListToHive(destinationList);

//         /// ==== Tariff List ==== ///
//         /// Extract Tariff list
//         List<TariffInfo> tariffList =
//             (responseData['data']['tariff_info'] as List)
//                 .map((data) => TariffInfo.fromJson(data))
//                 .toList();
//         // Save Tariff list to Hive
//         await saveTariffListToHive(tariffList);
//       }
//     } catch (e) {
//       print("error::++++++++++> $e");
//       throw Exception('An error occurred: $e');
//     } finally {
//       await Hive.close();
//     }
//   }
// }
