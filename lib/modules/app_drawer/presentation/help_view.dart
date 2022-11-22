import 'package:cheffy/modules/app_drawer/presentation/app_drawer_provider.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  void initState() {
    super.initState();
    final drawerProvider = context.read<AppDrawerProvider>();
    drawerProvider.getHelpQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final drawerProvider = context.watch<AppDrawerProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: BackgroundProgress<AppDrawerProvider>(
        child: drawerProvider.helpQuestions.isEmpty
            ? Center(
                child: Text(
                  'No help available rigt now, please come back later',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: drawerProvider.helpQuestions.length,
                itemBuilder: (context, i) {
                  final question = drawerProvider.helpQuestions[i];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          question.title,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              question.content,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
