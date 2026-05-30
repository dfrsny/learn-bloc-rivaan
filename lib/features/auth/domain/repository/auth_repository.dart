import 'package:fpdart/fpdart.dart';
import 'package:learn_bloc/core/error/failures.dart';

abstract interface class AuthRepository {
  Either<Failure, String> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Either<Failure, String> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  });
}