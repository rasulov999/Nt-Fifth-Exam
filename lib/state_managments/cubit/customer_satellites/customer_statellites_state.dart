import 'package:nt_fifth_exam/data/models/customer_satellites_model.dart';

abstract class CustomerSatellitesState {}

class InitialState extends CustomerSatellitesState {}

class LoadDataInProgress extends CustomerSatellitesState {}

class LoadDataInSucces extends CustomerSatellitesState {
  LoadDataInSucces({required this.model});
  final List<CustomerSatellitesModel> model;
}

class LoadDataInFailure extends CustomerSatellitesState {
  LoadDataInFailure({required this.errorText});

  final String errorText;
}
