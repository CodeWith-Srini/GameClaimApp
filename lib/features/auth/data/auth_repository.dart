import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final supabase = Supabase.instance.client;

  Future<void> login(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }
}
