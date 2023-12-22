import 'dart:convert';
import 'dart:developer';

import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:http/http.dart' as http;

abstract class ItemRemoteDatasource {
  Future<List<GetItemModel>> getItem();
  Future<void> redeem(
    int idReward,
    int quantity,
    int idEmployee,
  );
}

class ItemRemoteDatasourceIMPL implements ItemRemoteDatasource {
  final http.Client client;

  ItemRemoteDatasourceIMPL({required this.client});

  @override
  Future<List<GetItemModel>> getItem() async {
    final response = await client.get(
      Uri.parse('${NetworkAPI.baseURL}api/reward-active/1'),
      headers: {'x-access-token': NetworkAPI.tokenURL},
    );
    if (response.statusCode == 200) {
      return itemListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }

  @override
  Future<void> redeem(
    int idReward,
    int quantity,
    int idEmployee,
  ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/redeem-transaction");
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '',
      },
      body: jsonEncode({
        idEmployee,
        quantity,
        idReward,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      log("Redeem Reward Success");
    } else {
      throw ServerFailure();
    }
  }
}
