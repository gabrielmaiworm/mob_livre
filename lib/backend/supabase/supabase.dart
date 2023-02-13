import 'package:supabase_flutter/supabase_flutter.dart';

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl = 'https://fwwwcvkpstkyrbaplgke.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3d3djdmtwc3RreXJiYXBsZ2tlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQ0ODE5MTEsImV4cCI6MTk5MDA1NzkxMX0.Uk8QtagCkx_K31pOprxMt1rbAI-WnpGI5qKyDh03Y2U';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
      );
}
