import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sustomer_task/export.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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

  Widget getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.surveyData.question,
            style: textStyles.robotoBold,
          ),
          verticalSpacer(20),
          SizedBox(
            height: sizes.height * 0.6,
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return answersWidget(
                    answers: controller.surveyData.options,
                    index: index,
                  );
                },
                itemCount: 4),
          ),
        ],
      ),
    );
  }

  Widget answersWidget({
    required List<String> answers,
    required int index,
  }) {
    return Row(
      children: [
        Obx(() {
          return Radio(
              value: controller.selectedValue.value,
              groupValue: index,
              onChanged: (value) {
                controller.selectedValue.value = index;
                controller.openDetailsPage();
              });
        }),
        Text(
          answers[index],
          style: textStyles.robotoMedium,
        ),
      ],
    );
  }
}
