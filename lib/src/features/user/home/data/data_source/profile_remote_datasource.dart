import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/features/user/home/data/model/get_profile_model.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDatasource {
  Future<GetProfileModel> getProfile();
}

class ProfileRemoteDatasourceIMPL implements ProfileRemoteDatasource {
  final http.Client client;

  ProfileRemoteDatasourceIMPL({required this.client});

  @override
  Future<GetProfileModel> getProfile() async {
    final response = await client.get(
      Uri.parse('${NetworkAPI.baseURL}api/profile'),
      headers: {
        'x-access-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlcyI6MSwiaWRDb21wYW55IjoxLCJpZFJvbGUiOjQsImlhdCI6MTcwMjYxMDM2NSwiZXhwIjoxNzAyNjk2NzY1fQ.HKx-gx0OhjrI1norWsEYvqV8NEUNNgFRhp6mqZ7RE3Y'
      },
    );
    if (response.statusCode == 200) {
      return userListFromJson(response.body);
    } else {
      throw ServerException(message: 'error');
    }
  }
}
