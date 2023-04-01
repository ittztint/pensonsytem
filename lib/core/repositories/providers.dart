import 'package:pensionsystem/core/repositories/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  //The providers for dependency injection and state management are to added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    //format for registering providers:
    ListenableProvider(create: (_) => UserProvider()),


  ];
}