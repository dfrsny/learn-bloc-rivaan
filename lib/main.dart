import 'package:flutter/material.dart';
import 'package:learn_bloc/core/secrets/app_secrets.dart';
import 'package:learn_bloc/core/theme/theme.dart';
import 'package:learn_bloc/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:learn_bloc/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:learn_bloc/features/auth/domain/usecase/user_sign_up.dart';
import 'package:learn_bloc/features/auth/presentation/pages/signin_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUp: UserSignUp(
              AuthRepositoryImpl(AuthRemoteDataSourceImpl(supabase.client)),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const SignInPage(),
    );
  }
}
