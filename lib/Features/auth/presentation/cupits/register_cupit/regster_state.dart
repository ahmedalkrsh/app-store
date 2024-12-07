part of 'regster_cubit.dart';

@immutable
abstract class RegsterState {}

class RegsterInitial extends RegsterState {}

class RegsterLoading extends RegsterState {}

class RegsterSuccess extends RegsterState {
  final UserResponse user;

  RegsterSuccess(this.user);
  List<Object?> get props => [user];
}

class RegsterFailure extends RegsterState {
  final String message;
  RegsterFailure({required this.message});
}
