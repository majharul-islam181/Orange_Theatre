abstract class BaseApiServices {
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(String url, var data, {String? token});
  Future<dynamic> delete(String url);
  // Future<dynamic> Put(String url);
}
