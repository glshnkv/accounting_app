
import 'package:shared_preferences/shared_preferences.dart';

const String _kfirstNameKey = 'firstName';
const String _klastNameKey = 'lastName';
const String _kgenderKey = 'gender';


class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  dynamic _getData(String key) {
    var value = _preferences.get(key);

    print('Retrieved $key: $value');

    return value;
  }

  void _saveData(String key, dynamic value) {
    print('Saving $key: $value');

    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  String get firstName => _getData(_kfirstNameKey) ?? 'New';
  set firstName(String value) => _saveData(_kfirstNameKey, value);

  String get lastName => _getData(_klastNameKey) ?? 'User';
  set lastName(String value) => _saveData(_klastNameKey, value);

  String get gender => _getData(_kgenderKey) ?? 'Male';
  set gender(String value) => _saveData(_kgenderKey, value);
}
