import 'package:covitrac/app/repositories/data_repository.dart';
import 'package:covitrac/app/services/api.dart';
import 'package:covitrac/app/services/api_service.dart';
import 'package:covitrac/app/services/data_cache_service.dart';
import 'package:covitrac/ui/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'en_GB';
  await initializeDateFormatting();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({Key key, @required this.sharedPreferences}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(
          API.sandbox(),
        ),
        dataCacheService:
            DataCacheService(sharedPreferences: sharedPreferences),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Dosis',
        ),
        home: BottomBar(),
      ),
    );
  }
}
