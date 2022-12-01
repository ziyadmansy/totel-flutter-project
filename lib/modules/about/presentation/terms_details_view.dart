import 'package:cheffy/Utils/policy_constants.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TermsDetailsView extends StatelessWidget {
  const TermsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedWidgets.buildHomeAppBar(title: 'Terms & Conditions'),
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
