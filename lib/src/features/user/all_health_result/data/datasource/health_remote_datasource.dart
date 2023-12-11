import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/features/user/all_health_result/data/model/get_health_model.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:http/http.dart' as http;

abstract class HealthRemoteDatasource {
  Future<GetHealthModel> getHealth();
}

class HealthRemoteDatasourceIMPL implements HealthRemoteDatasource {
  final http.Client client;

  HealthRemoteDatasourceIMPL({required this.client});

  @override
  Future<GetHealthModel> getHealth() async {
    final response = await client.get(
        Uri.parse('${NetworkAPI.baseURL}api/healthCheck/getHealthCheckUser/1'));
    if (response.statusCode == 200) {
      return healthListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }
}
