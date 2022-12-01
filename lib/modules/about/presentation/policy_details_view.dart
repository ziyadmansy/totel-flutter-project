import 'package:cheffy/Utils/policy_constants.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PrivacyPolicyDetailsView extends StatelessWidget {
  const PrivacyPolicyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedWidgets.buildHomeAppBar(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HtmlWidget(
            termsAndConditionsHtml,
          ),
        ),
      ),
    );
  }
}
