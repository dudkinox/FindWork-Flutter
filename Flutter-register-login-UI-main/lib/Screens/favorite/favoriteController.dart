import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/model/favoriteModel.dart';
import 'package:login_ui/model/jobModel.dart';

Future<List<JobDataModel>> listFavorite(String token) async {
  FavoriteModel data = await GetFavorite(token);
  List<JobDataModel> datalist = [];
  if (data != null) {
    for (var i = 0; i < data?.jobId.length; i++) {
      var tokenJob = data?.jobId[i];
      JobDataModel detail = await TopicWorkFindID(tokenJob);
      if (detail != null) {
        detail?.id = tokenJob;
        datalist.add(detail);
      }
    }
  }
  return datalist;
}
