import 'package:fpdart/fpdart.dart';
import 'package:learn_bloc/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  });
}