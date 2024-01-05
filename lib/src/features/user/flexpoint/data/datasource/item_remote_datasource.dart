import 'dart:convert';
import 'dart:developer';

import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/core/storage/secure_storage.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/redeem_model.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/redeem_entity.dart';
import 'package:http/http.dart' as http;

abstract class ItemRemoteDatasource {
  Future<List<GetItemModel>> getItem(int idCom);
  Future<void> redeem(
      int idReward, int quantity, int idEmployee, List<CoinRe> coins);
}

class ItemRemoteDatasourceIMPL implements ItemRemoteDatasource {
  final http.Client client;

  ItemRemoteDatasourceIMPL({required this.client});

  @override
  Future<List<GetItemModel>> getItem(int idCom) async {
    final response = await client.get(
      Uri.parse('${NetworkAPI.baseURL}api/reward-active/$idCom'),
      headers: {'x-access-token': '${await LoginStorage.readToken()}'},
    );
    if (response.statusCode == 200) {
      return itemListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }

  @override
  Future<void> redeem(
      int idReward, int quantity, int idEmployee, List<CoinRe> coins) async {
    final url = Uri.parse("${NetworkAPI.baseURL}api/redeem-transaction");
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '${await LoginStorage.readToken()}',
      },
      body: jsonEncode({
        'idReward': idReward,
        'quantity': quantity,
        'idEmployee': idEmployee,
        'coins': coins.map((coin) => {'amount': coin.amount}).toList(),
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
