import 'package:eclipse_task/repositories/comments/comments_repository.dart';
import 'package:eclipse_task/repositories/comments/comments_repository_interface.dart';
import 'package:eclipse_task/repositories/users/users_repository.dart';
import 'package:eclipse_task/repositories/users/users_repository_interface.dart';
import 'package:eclipse_task/screens/home/bloc/home_screen_bloc.dart';
import 'package:eclipse_task/services/comments/comments_service.dart';
import 'package:eclipse_task/services/comments/comments_service_interface.dart';
import 'package:eclipse_task/services/local_storage/local_storage_service.dart';
import 'package:eclipse_task/services/local_storage/local_storage_service_interface.dart';
import 'package:eclipse_task/services/users/users_service.dart';
import 'package:eclipse_task/services/users/users_service_interface.dart';
import 'package:eclipse_task/shared/http_client/http_client.dart';
import 'package:eclipse_task/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Services declaration
  late final LocalStorageServiceInterface _localStorageService;
  late final HttpClient _httpClient;
  late final UsersServiceInterface _usersService;
  late final CommentsServiceInterface _commentsService;

  /// Repositories declaration
  late final UsersRepositoryInterface _usersRepository;
  late final CommentsRepositoryInterface _commentsRepository;

  @override
  void initState() {
    super.initState();

    /// Services instantiation
    _localStorageService = LocalStorageService();
    _httpClient = HttpClient(localStorageService: _localStorageService);
    _usersService = UsersService(httpClient: _httpClient);
    _commentsService = CommentsService(httpClient: _httpClient);

    /// Repositories instantiation
    _usersRepository = UsersRepository(usersService: _usersService);
    _commentsRepository = CommentsRepository(commentsService: _commentsService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CommentsRepositoryInterface>(
            create: (context) => _commentsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeScreenBloc(usersRepository: _usersRepository)
                  ..add(
                    HomeScreenFetchUsersEvent(),
                  ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(cursorColor: Color(0xFF00A86B)),
            primaryColor: Color(0xFF00A86B),
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Color(0xFF00A86B),
            ),
          ),
          initialRoute: Routes.home,
          routes: Routes.routes,
        ),
      ),
    );
  }
}
