import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sustomer_task/export.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: SafeArea(
        child: controller.obx(
          (state) => getBody(context),
          onLoading: const LoadingState(),
          onEmpty: const EmptyState(),
        ),
      ),
    );
  }

  getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Survey Average Result',
            style: textStyles.robotoBold,
          ),
          verticalSpacer(40),
          getPercentageWidget(0, 0.5),
          verticalSpacer(20),
          getPercentageWidget(1, 0.3),
          verticalSpacer(20),
          getPercentageWidget(2, 0.2),
          verticalSpacer(20),
          getPercentageWidget(3, 0.1),
          Spacer(),
          Obx(() {
            return Text(
              'Next question will be show in ${controller.timeValue.value.toInt()} sec',
              style: textStyles.robotoRegular,
            );
          }),
        ],
      ),
    );
  }

  getPercentageWidget(int index, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ans ${index + 1}.',
          style: textStyles.robotoMedium,
        ),
        LinearProgressIndicator(
          backgroundColor: colors.primaryLight,
          valueColor: AlwaysStoppedAnimation<Color>(
            index == controller.selectedAnswer
                ? colors.accentSecondary
                : colors.colorGrey,
          ),
          value: value,
        ),
        Text('${(value * 100).round()}%'),
      ],
    );
  }
}
