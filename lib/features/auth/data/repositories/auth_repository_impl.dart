import 'package:fpdart/src/either.dart';
import 'package:learn_bloc/core/error/exceptions.dart';
import 'package:learn_bloc/core/error/failures.dart';
import 'package:learn_bloc/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:learn_bloc/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);
  // const AuthRepositoryImpl(AuthRemoteDataSourceImpl authRemoteDataSourceImpl, {
  //   required this.remoteDataSource,
  // });

  @override
  Future<Either<Failure, String>>
  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>>
  signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource
          .signUpWithEmailAndPassword(
            username: username,
            email: email,
            password: password,
          );
      return right(userId);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
