import 'package:dio/dio.dart';
class AppsClass {
  Dio dio = Dio();
  String? id;
  Future<Response?> getDataFree() async {
    try {
      final res = await dio.get(
          'https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json');
      if (res.statusCode == 200) {
        return res;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Response?> getData1(id) async {
    try {
      final res = await dio.get('https://itunes.apple.com/lookup?id=$id');
      if (res.statusCode == 200) {
        return res;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Response?> getDataPaid() async {
    try {
      final res = await dio.get('https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json');
      if (res.statusCode == 200) {
        return res;
      }
    } catch (e) {
      print(e);
    }
  }
}
