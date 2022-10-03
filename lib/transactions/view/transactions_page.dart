import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trilha_propulsao/shared/widgets/botton_navigation_bar.dart';

import '../wigdet/body_movement.dart';

class TransitionsPage extends HookConsumerWidget {
  const TransitionsPage({Key? key}) : super(key: key);

  static const routeName = '/transactions-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: MovementBody(),
    );
  }
}
