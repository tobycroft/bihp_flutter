import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<String> Get(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    if (share.getString(key) != null) {
      return share.getString(key).toString();
    } else {
      return "";
    }
  }

  Future<bool> Set(String key, value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.setString(key, value);
  }

  Future<bool> Clear() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.clear();
  }

  Future<bool> Delete(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.remove(key);
  }

  Future<bool> Has(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.containsKey(key);
  }

  Future<String?> GetString(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.getString(key);
  }
}
