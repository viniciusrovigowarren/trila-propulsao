import 'package:flutter/material.dart';

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
        title: const Text('Revisar'),
      ),
      body: BodyReview(),
    );
  }
}
