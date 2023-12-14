import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/features/user/all_health_result/data/model/get_health_model.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:ant_project/src/features/user/treatment_history/data/model/get_treatment_model.dart';
import 'package:http/http.dart' as http;

abstract class TreatmentRemoteDatasource {
  Future<GetTreatmentModel> getTreatment();
}

class TreatmentRemoteDatasourceIMPL implements TreatmentRemoteDatasource {
  final http.Client client;

  TreatmentRemoteDatasourceIMPL({required this.client});

  @override
  Future<GetTreatmentModel> getTreatment() async {
    final response = await client
        .get(Uri.parse('${NetworkAPI.baseURL}api/health/getHealthProfile/1'));
    if (response.statusCode == 200) {
      return treatmentListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }
}
