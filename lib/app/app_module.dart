import 'package:flutter/material.dart';
import 'package:flutter_todolist_provider/app/app_widget.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Object(),
        ),
      ],
      child: AppWidget(),
    );
  }
}
