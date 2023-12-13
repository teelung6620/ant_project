import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/features/user/all_health_result/data/model/get_health_model.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:ant_project/src/features/user/health_check/data/model/get_hospital_model.dart';
import 'package:http/http.dart' as http;

abstract class HospitalRemoteDatasource {
  Future<List<GetHospitalModel>> getHospital();
}

class HospitalRemoteDatasourceIMPL implements HospitalRemoteDatasource {
  final http.Client client;

  HospitalRemoteDatasourceIMPL({required this.client});

  @override
  Future<List<GetHospitalModel>> getHospital() async {
    final response = await client
        .get(Uri.parse('${NetworkAPI.baseURL}api/hospital/getAllHospitalList'));
    if (response.statusCode == 200) {
      return hospitalListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }
}
