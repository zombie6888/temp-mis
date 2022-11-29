import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../features/client/appointment/appointment_doctor_screen.dart';

final loggedOutMap = RouteMap(
  onUnknownRoute: (route) => const Redirect('/'),
  routes: {'/': (_) => MaterialPage(child: Container())},
);

RouteMap routes(context) => RouteMap(
      routes: {
        '/': (_) => const MaterialPage(child: AppointmentDoctorScreen())
        },
    );

const Map<String, String> tabs = {  
};

const Map<String, String> tabIcons = {  
};

const Map<String, String> titles = {  
};
