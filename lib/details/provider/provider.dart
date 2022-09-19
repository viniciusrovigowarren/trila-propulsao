import 'package:hooks_riverpod/hooks_riverpod.dart';

final timeFrameProvider = StateProvider<int>(
  (ref) => 5,
);
