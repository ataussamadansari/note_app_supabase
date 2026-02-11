import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
final supabaseAuth = supabase.auth;
final currentSession = supabaseAuth.currentSession;
final currentUser = supabaseAuth.currentUser;
