import 'package:flutter/material.dart';

import '../../l10n/app.dart';
import '../widgets/body_review.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  static const routeName = '/review-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(CoreString.of(context)!.rev),
      ),
      body: const BodyReview(),
    );
  }
}//

