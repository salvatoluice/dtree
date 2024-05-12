import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dtree/models/user_model.dart';

final userProvider = StateProvider<User?>((ref) => null);

final tokenProvider = StateProvider<String?>((ref) => null);
