import 'package:cheffy/modules/about/presentation/about_view_model.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class AboutScreenView extends ViewModelBuilderWidget<AboutViewModel> {
  const AboutScreenView({super.key});

  ListTile buildAboutListTile({
    required String title,
    required IconData icon,
    required VoidCallback onPress,
  }) {
    return ListTile(
      title: Text(title),
      leading: FaIcon(
        icon,
        color: Colors.grey,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onPress,
    );
  }

  @override
  Widget builder(
      BuildContext context, AboutViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: SharedWidgets.buildHomeAppBar(title: 'About Totel'),
      body: ListView(
        children: [
          buildAboutListTile(
            title: 'Privacy Policy',
            icon: Icons.policy,
            onPress: viewModel.onPrivacyPolicyClick,
          ),
          buildAboutListTile(
            title: 'Terms of use',
            icon: Icons.report_outlined,
            onPress: viewModel.onTermsAndConditionsClick,
          ),
          buildAboutListTile(
            title: 'Rate us',
            icon: FontAwesomeIcons.faceSmile,
            onPress: () {},
          ),
        ],
      ),
    );
  }

  @override
  AboutViewModel viewModelBuilder(BuildContext context) {
    return AboutViewModel();
  }
}
