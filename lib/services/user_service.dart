import 'package:news_app/models/news_response.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/models/cb_network_error.dart';

class UserService extends APIService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();

  Future<NewsResponse> getAllNewsHighlight({
    String category,
    String keyWord,
    String country = 'in',
    int pageSize = 100,
    int page = 1,
  }) async {
    Map<String, String> body = {
      'country': country,
      'category': category,
      'q': keyWord,
      'pageSize': pageSize.toString(),
      'page': page.toString(),
    };
    body.removeWhere(
        (String key, String value) => value == null || value == 'null');

    try {
      Map<String, dynamic> response = await get('/top-headlines', params: body);
      NewsResponse newsResponse = NewsResponse.fromJson(response);

      return newsResponse;
    } on CbNetworkError catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<NewsResponse> getAllNewsEverything({
    String qInTitle,
    String keyWord = 'juice',
    String sources,
    String domain ,
    int page = 1,
    int pageSize = 100,
  }) async {
    Map<String, String> body = {
      'q': keyWord,
      'sources': sources,
      'domain': domain,
      'qInTitle': qInTitle,
      'pageSize': pageSize.toString(),
      'page': page.toString(),
    };
    print('body is ${body}');
    body.removeWhere(
        (String key, String value) => value == null || value == 'null');

    try {
      Map<String, dynamic> response = await get('/everything', params: body);
      NewsResponse newsResponse = NewsResponse.fromJson(response);

      return newsResponse;
    } on CbNetworkError catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
