import 'package:cheffy/Models/occupation.dart';
import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/core/enums/male_female_enum.dart';
import 'package:cheffy/core/services/secure_storage_service.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/modules/profile/profile/domain/repositories/profile_repo.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_image_picker/image_file.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class ProfileProvider extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final BottomSheetService _bottomSheetService = locator.get();
  final SnackbarService _snackbarService = locator.get();
  final SecureStorageService _secureStorageService = locator.get();

  bool isLoading = false;

  late final FormGroup editProfileForm;

  bool _isMalePartner = true;
  bool _isFemalePartner = true;

  final ProfileRepo profileRepo;

  ProfileEntity? profileEntity;
  List<Occupation> occupations = [];

  ProfileProvider(this.profileRepo) {
    editProfileForm = FormGroup({
      ReactiveFormControls.firstName: FormControl(
        validators: [Validators.required],
      ),
      ReactiveFormControls.lastName: FormControl(
        validators: [Validators.required],
      ),
      ReactiveFormControls.native: FormControl(
        validators: [Validators.required],
      ),
      ReactiveFormControls.avatar: FormControl<ImageFile>(),
      ReactiveFormControls.occupation: FormControl<int>(
        validators: [Validators.required],
      ),
      ReactiveFormControls.bio: FormControl(
        validators: [Validators.required],
      ),
      ReactiveFormControls.gender: FormControl(
        validators: [Validators.required],
      ),
    });
  }

  //region getters setters

  MaleFemaleEnum maleFemaleEnum = MaleFemaleEnum.male;

  void onMaleFemaleChoice(MaleFemaleEnum? selMaleFemaleEnum) {
    if (selMaleFemaleEnum != null) {
      maleFemaleEnum = selMaleFemaleEnum;
      notifyListeners();
    }
  }

  //endregion

  Future<void> getProfile() async {
    try {
      setBusy(true);
      profileEntity = await profileRepo.get();
      // await _secureStorageService.setAppUser(profileEntity);
      notifyListeners();
    } catch (e) {
      _snackbarService.showSnackbar(
          title: 'Error', message: 'Something went wrong, please try again');
    } finally {
      setBusy(false);
    }
  }

  Future<void> getOccupations() async {
    try {
      setBusy(true);
      occupations = await profileRepo.getOccupations();
      notifyListeners();
    } catch (e) {
      _snackbarService.showSnackbar(
          title: 'Error', message: 'Something went wrong, please try again');
    } finally {
      setBusy(false);
    }
  }

  Future<void> onEditSave() async {
    try {
      setBusy(true);

      final editedProfile = ProfileEntity(
        id: profileEntity!.id,
        firstName:
            editProfileForm.control(ReactiveFormControls.firstName).value,
        lastName: editProfileForm.control(ReactiveFormControls.lastName).value,
        username: profileEntity!.username,
        email: profileEntity!.email,
        native: editProfileForm.control(ReactiveFormControls.native).value,
        bio: editProfileForm.control(ReactiveFormControls.bio).value,
        phoneNo: profileEntity!.phoneNo,
        dateOfBrith: profileEntity!.dateOfBrith,
        avatar: profileEntity!.avatar,
        city: profileEntity!.city,
        rating: profileEntity!.rating,
        gender: maleFemaleEnum.name,
        createdAt: profileEntity!.createdAt,
        updatedAt: profileEntity!.updatedAt,
        hobbie: profileEntity!.hobbie,
        occupation: Occupation(
          id: (editProfileForm.control(ReactiveFormControls.occupation).value
              as int),
          name: '',
        ),
      );

      profileEntity = await profileRepo.update(
        editedProfile,
        newAvatar: (editProfileForm.control(ReactiveFormControls.avatar).value
                as ImageFile?)
            ?.image,
      );
      notifyListeners();
      _navigationService.back();
    } catch (e) {
      print(e);
      _snackbarService.showSnackbar(
        title: 'Error',
        message: 'Something went wrong, please try again',
      );
    } finally {
      setBusy(false);
    }
  }

  void onShare() {}

  void onWallet() => _navigationService.navigateToWalletView();

  void onEdit() => _navigationService.navigateToEditProfileView();

  void onPosts() {}

  void onBookmark() {}

  void onMessage() {}

  void onTapPost() {}
}
