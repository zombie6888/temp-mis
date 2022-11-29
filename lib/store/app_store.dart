import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mis/store/appointment/appointment_bloc.dart';
import 'package:provider/provider.dart';
import '../api/api_config.dart';
import '../api/api_repository.dart';
import 'repositories.dart';

class AppStore extends StatefulWidget {
  final Widget child;
  const AppStore({Key? key, required this.child}) : super(key: key);

  @override
  State<AppStore> createState() => _AppStoreState();
}

class _AppStoreState extends State<AppStore> {
  @override
  Widget build(BuildContext context) {   
    return Consumer<ApiConfig>(builder: (context, apiConfig, child) {
      return Repositories(
          config: apiConfig,
          child: MultiBlocProvider(
              providers: [
                 BlocProvider(
                    create: (context) =>
                        AppointmentBloc(repository: context.read<ApiRepository>())),
              ],
              child: Builder(builder: (context) {
                return widget.child;
              }))); //
    });
  }
}
