part of 'single_state_bloc_bloc.dart';

class SingleStateBlocState extends Equatable {
  const SingleStateBlocState({required this.statusText});
  final StatusText statusText;
  SingleStateBlocState copyWith({
    StatusText? statusText,
  }) =>
      SingleStateBlocState(statusText: statusText ?? this.statusText);

  @override
  List<Object> get props => [statusText];
}

enum StatusText {
  added,
  deleted,
  pure,
}
