import 'package:flutter/material.dart';

import 'time_frame_item.dart';

class TimeFrame extends StatelessWidget {
  const TimeFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        TimeFrameItem(
          itemSelected: true,
          time: '5',
        ),
        TimeFrameItem(
          itemSelected: false,
          time: '15',
        ),
        TimeFrameItem(
          itemSelected: false,
          time: '30',
        ),
        TimeFrameItem(
          itemSelected: false,
          time: '45',
        ),
        TimeFrameItem(
          itemSelected: false,
          time: '90',
        ),
      ],
    );
  }
}
