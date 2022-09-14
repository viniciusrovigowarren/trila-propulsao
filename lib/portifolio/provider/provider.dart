import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageIndexProvider = StateProvider<int>(((ref) => 0));
final visible = StateProvider<bool>(((ref) => false));
