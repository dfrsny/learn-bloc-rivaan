import 'package:fpdart/src/either.dart';
import 'package:learn_bloc/core/error/failures.dart';
import 'package:learn_bloc/core/usecase/usecase.dart';
import 'package:learn_bloc/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String username;
  final String email;
  final String password;

  UserSignUpParams({
    required this.username,
    required this.email,
    required this.password,
  });
}
