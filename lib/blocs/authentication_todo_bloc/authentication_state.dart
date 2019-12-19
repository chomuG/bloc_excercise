import 'package:equatable/equatable.dart';

//equatable은 두 authenticationState를 비교하기위해 사용, default로 두 instance가 같으면 true 반환(super class에 전달)
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String userId;

  const Authenticated(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'Authenticated { userId : $userId }';
}

class Unauthenticated extends AuthenticationState {}
