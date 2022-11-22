import 'package:cheffy/modules/app_drawer/domain/entities/help_entity.dart';

abstract class AppDrawerRepo {
  Future<List<HelpEntity>> getHelpMenu();
}
