import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:http/http.dart' as http;

abstract class ItemRemoteDatasource {
  Future<List<GetItemModel>> getItem();
}

class ItemRemoteDatasourceIMPL implements ItemRemoteDatasource {
  final http.Client client;

  ItemRemoteDatasourceIMPL({required this.client});

  @override
  Future<List<GetItemModel>> getItem() async {
    final response =
        await client.get(Uri.parse('${NetworkAPI.baseURL}api/getAllItem'));
    if (response.statusCode == 200) {
      return itemListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }
}
