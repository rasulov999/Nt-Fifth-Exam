import 'package:equatable/equatable.dart';
import 'package:nt_fifth_exam/data/models/customer_satellites_model.dart';

class SingleState extends Equatable {
  const SingleState({
    required this.model,
    required this.statusText,
    required this.errorText,
  });
  final StatusText statusText;
  final List<CustomerSatellitesModel> model;
  final String errorText;

  SingleState copyWtih({
    StatusText? statusText,
    List<CustomerSatellitesModel>? model,
    String? errorText,
  }) =>
      SingleState(
          statusText: statusText ?? this.statusText,
          model: model ?? this.model,
          errorText: errorText ?? this.errorText);

  @override
  List<Object?> get props => [
        model,
        statusText,
        errorText,
      ];
}

enum StatusText { loading, succes,pure, error }
