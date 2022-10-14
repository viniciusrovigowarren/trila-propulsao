import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/allcoins_controller.dart';
import '../controller/convert_controller.dart';

final allCoinsControllerProvider =
    ChangeNotifierProvider((ref) => AllCoinsController());

final convertControllerProvider =
    ChangeNotifierProvider((ref) => ConvertController());
