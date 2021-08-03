import 'package:flutter/material.dart';
import './screens/remote_detail_screen.dart';
import 'package:provider/provider.dart';
import './screens/splash_screen.dart';
import './providers/remoteok_provider.dart';
import './screens/home_screen.dart';
import './delegates/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: RemoteokProvider(),
        ),
      ],
      child: Consumer<RemoteokProvider>(builder: (ctx, data, _) {
        return !data.isLoading
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: appTheme,
                home: !data.isLoading ? HomeScreen() : SplashScreen(),
                routes: {
                     RemoteDetailScreen.routeName: (ctx) =>
                        RemoteDetailScreen(), 
                  })
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
