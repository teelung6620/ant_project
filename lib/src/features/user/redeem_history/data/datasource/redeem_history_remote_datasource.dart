import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/storage/secure_storage.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:ant_project/src/features/user/insurance/data/model/get_insurance_model.dart';
import 'package:ant_project/src/features/user/redeem_history/data/model/redeem_history_model.dart';
import 'package:http/http.dart' as http;

abstract class RedeemHistoryRemoteDatasource {
  Future<List<RedeemHistoryModel>> getRedeem(int idEmp);
}

class RedeemHistoryRemoteDatasourceIMPL
    implements RedeemHistoryRemoteDatasource {
  final http.Client client;

  RedeemHistoryRemoteDatasourceIMPL({required this.client});

  @override
  Future<List<RedeemHistoryModel>> getRedeem(idEmp) async {
    final response = await client.get(
      Uri.parse('${NetworkAPI.baseURL}api/my-redeem-reward/$idEmp'),
      headers: {'x-access-token': '${await LoginStorage.readToken()}'},
    );
    if (response.statusCode == 200) {
      return redeemHistoryListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }
}
