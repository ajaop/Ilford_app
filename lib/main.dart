import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilford_app/blocs/authentication/authentication_bloc.dart';
import 'package:ilford_app/blocs/bloc_observer.dart';
import 'package:ilford_app/firebase_options.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/ui/personal_details.dart';
import 'package:ilford_app/ui/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = const AppBlocObserver();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(MyApp(authenticationRepository: authenticationRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
            authenticationRepository: _authenticationRepository),
        child: MaterialApp(
          title: 'ILFORD',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: CustomCOlors.primaryColor),
            useMaterial3: true,
          ),
          home: PersonalDetails(),
        ),
      ),
    );
  }
}
