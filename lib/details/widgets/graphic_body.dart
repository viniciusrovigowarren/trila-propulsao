import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/provider.dart';
import 'graphic15m.dart';
import 'graphic30m.dart';
import 'graphic45m.dart';
import 'graphic5m.dart';
import 'graphic90m.dart';

class GraphicBody extends HookConsumerWidget {
  const GraphicBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeFrame = ref.watch(timeFrameProvider.state);

    switch (timeFrame.state) {
      case (5):
        return const Graphic5m();
      case (15):
        return const Graphic15m();
      case (30):
        return const Graphic30m();
      case (45):
        return const Graphic45m();
      case (90):
        return const Graphic90m();
      default:
        return const Graphic5m();
    }
  }
}
