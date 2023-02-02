import 'package:nt_fifth_exam/data/api/api_service.dart';
import 'package:nt_fifth_exam/data/models/my_response.dart';
import 'package:nt_fifth_exam/data/sql/storage/storage.dart';

class SatellitesRepository {
  SatellitesRepository({required this.apiService});
  final ApiService apiService;

  Future<MyResponse> getData() => apiService.getData();

  Future<StorageRepository> getInstance() =>
      StorageRepository.getInstance();
 
}
