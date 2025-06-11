import 'package:project2/core/api_config/client/api_client.dart';
import 'package:project2/core/api_config/endpoints/api_endpoint.dart';

import '../model/animeDataModel.dart';

class homeRepository{
  final ApiClient apiClient;

  homeRepository({required this.apiClient});
  
  Future<List<Anime>>getAnimeData()async{
    try{
      final response = await apiClient.request(RequestType.GET, ApiEndPoint.animeUrl);
      final List<dynamic> data = response['data'];
      return data.map((animeJson) => Anime.fromJson(animeJson)).toList();
    }catch(e){
      rethrow;
    }
  }

  Future<Anime>getAnimeDataById(int id)async{
    try{
      final response = await apiClient.request(RequestType.GET,'${ApiEndPoint.animeByIdUrl}/$id');
      final Anime data = Anime.fromJson(response['data']);
      return data;
    }catch(e){
      rethrow;
    }
  }
}