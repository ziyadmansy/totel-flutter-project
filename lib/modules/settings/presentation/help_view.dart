import 'package:cheffy/modules/settings/presentation/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HelpView extends ViewModelBuilderWidget<SettingsViewModel> {
  const HelpView({super.key});

  @override
  Widget builder(BuildContext context, SettingsViewModel viewModel, ch) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {
          return Card(
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text(
                  'Lorem ipsum?',
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam commodo mi lacinia neque commodo gravida. Aenean nisl quam, malesuada at nisl sit amet, hendrerit vestibulum est. Mauris facilisis tellus pretium sodales sollicitudin. Quisque quis leo bibendum, dictum lectus quis, rutrum neque. Maecenas vel nibh vitae nisl pulvinar convallis vel eget mi. Phasellus porta volutpat lobortis. Mauris quis consequat urna.',
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) =>
      SettingsViewModel();
}
