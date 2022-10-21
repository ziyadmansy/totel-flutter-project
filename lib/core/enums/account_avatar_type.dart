enum AccountAvatarType { Account, Drawer, AppBar }

extension AccountAvatarTypeExtension on AccountAvatarType {
  double get radius {
    switch (this) {
      case AccountAvatarType.Account:
        return 56.5;
      case AccountAvatarType.Drawer:
        return 35.0;
      case AccountAvatarType.AppBar:
        return 42.0;
      default:
        return 35.0;
    }
  }

  bool get shadow {
    switch (this) {
      case AccountAvatarType.Account:
        return true;
      case AccountAvatarType.Drawer:
        return true;
      case AccountAvatarType.AppBar:
        return false;
    }
  }

  bool get border {
    switch (this) {
      case AccountAvatarType.Account:
        return false;
      case AccountAvatarType.Drawer:
        return false;
      case AccountAvatarType.AppBar:
        return false;
    }
  }
}
