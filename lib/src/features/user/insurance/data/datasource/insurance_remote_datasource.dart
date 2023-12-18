import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:ant_project/src/features/user/insurance/data/model/get_insurance_model.dart';
import 'package:http/http.dart' as http;

abstract class InsuranceRemoteDatasource {
  Future<List<GetInsuranceModel>> getInsurance();
}

class InsuranceRemoteDatasourceIMPL implements InsuranceRemoteDatasource {
  final http.Client client;

  InsuranceRemoteDatasourceIMPL({required this.client});

  @override
  Future<List<GetInsuranceModel>> getInsurance() async {
    final response = await client.get(
      Uri.parse('${NetworkAPI.baseURL}api/insurance/getAllInsurance'),
      headers: {'x-access-token': NetworkAPI.tokenURL},
    );
    if (response.statusCode == 200) {
      return insuranceListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }
}
