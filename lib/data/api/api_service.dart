import 'package:dio/dio.dart';
import 'package:nt_fifth_exam/data/api/api_client.dart';
import 'package:nt_fifth_exam/data/models/customer_satellites_model.dart';
import 'package:nt_fifth_exam/data/models/my_response.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getData() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}/customer_satellites");
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        myResponse.data = ((response.data)["customer_satellites"] as List?)
                ?.map((e) => CustomerSatellitesModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
