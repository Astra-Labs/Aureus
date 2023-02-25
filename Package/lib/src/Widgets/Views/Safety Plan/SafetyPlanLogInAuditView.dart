// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SAFETY PLAN LOG IN AUDIT VIEW ----------*/
/// A view that allows the user to audit failed log ins. This is automatically
/// pulled from [Safety], so it requires no developer input.
class SafetyPlanLogInAuditView extends StatefulWidget {
  const SafetyPlanLogInAuditView();

  @override
  _SafetyPlanLogInAuditViewState createState() =>
      _SafetyPlanLogInAuditViewState();
}

class _SafetyPlanLogInAuditViewState extends State<SafetyPlanLogInAuditView> {
  var failedAttempts =
      resourceValues.safetySettings.readAllFailedLogInAttempts();

  @override
  Widget build(BuildContext context) {
    /* var futureBuilder = FutureBuilder(builder: builder);

    var failedAttemptsList = ListView.builder(itemBuilder: itemBuilder); */

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen, children: []);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
