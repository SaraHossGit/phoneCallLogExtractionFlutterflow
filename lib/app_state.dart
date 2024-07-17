import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _myCallState = prefs.getString('ff_myCallState') ?? _myCallState;
    });
    _safeInit(() {
      _myPhoneNumber = prefs.getString('ff_myPhoneNumber') ?? _myPhoneNumber;
    });
    _safeInit(() {
      _myTimestamp = prefs.getString('ff_myTimestamp') ?? _myTimestamp;
    });
    _safeInit(() {
      _myDuration = prefs.getString('ff_myDuration') ?? _myDuration;
    });
    _safeInit(() {
      _pausePeriodic = prefs.getBool('ff_pausePeriodic') ?? _pausePeriodic;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _myCallState = '';
  String get myCallState => _myCallState;
  set myCallState(String value) {
    _myCallState = value;
    prefs.setString('ff_myCallState', value);
  }

  String _myPhoneNumber = '';
  String get myPhoneNumber => _myPhoneNumber;
  set myPhoneNumber(String value) {
    _myPhoneNumber = value;
    prefs.setString('ff_myPhoneNumber', value);
  }

  String _myTimestamp = '';
  String get myTimestamp => _myTimestamp;
  set myTimestamp(String value) {
    _myTimestamp = value;
    prefs.setString('ff_myTimestamp', value);
  }

  String _myDuration = '';
  String get myDuration => _myDuration;
  set myDuration(String value) {
    _myDuration = value;
    prefs.setString('ff_myDuration', value);
  }

  bool _pausePeriodic = false;
  bool get pausePeriodic => _pausePeriodic;
  set pausePeriodic(bool value) {
    _pausePeriodic = value;
    prefs.setBool('ff_pausePeriodic', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
