// auth_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dtree/models/user_model.dart';

// Define the userProvider
final userProvider = StateProvider<User?>((ref) => null);

// Define the tokenProvider
final tokenProvider = StateProvider<String?>((ref) => null);
