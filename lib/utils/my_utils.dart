import 'package:get_it/get_it.dart';
import 'package:nt_fifth_exam/data/api/api_service.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiService>(ApiService());
}
