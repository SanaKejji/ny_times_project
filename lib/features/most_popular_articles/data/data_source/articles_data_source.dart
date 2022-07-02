import 'dart:convert';
import '../../../../../../../core/constant/apis/apis_url.dart';
import '../../../../core/unified_api/handling_response.dart';
import '../models/article.dart';
import 'package:http/http.dart' as http;

class ArticlesDataSource with HandlingResponse {
  Future<List<ArticleModel>> getArticlesDataSource({required Map<String, dynamic> params}) async {
    final period = params['period'];
    final section = params['section'];
    final endPoint =
        '${ApiUrls.baseURL}/mostpopular/v2/mostviewed/$section/$period.json?api-key=${ApiUrls.kAPIKey}';
    print(endPoint);
    var url = Uri.parse(endPoint);
    http.Response response = await http.get(url).timeout(const Duration(seconds: 30));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return articlesListFromMap(jsonDecode(response.body)['results']);
    } else {
      Exception exception = getException(response.statusCode);
      throw (exception);
    }
  }
}
