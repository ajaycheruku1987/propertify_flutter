import 'package:flutter/material.dart';

/// Global RouteObserver to monitor route changes and lifecycle events
/// (e.g. pausing video playback when navigating to another screen).
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
