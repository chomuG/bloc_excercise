import 'package:equatable/equatable.dart';

//equatable은 두 authenticationState를 비교하기위해 사용, default로 두 instance가 같으면 true 반환(super class에 전달)
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String displayName;

  const Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticated { displayName : $displayName }';
}

class Unauthenticated extends AuthenticationState {}
