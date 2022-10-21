import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/enums/post_type.dart';
import 'package:cheffy/core/methods/extensions.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/core/services/posts_service.dart';

class CreatePostViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final PostsService _postsService = locator.get();
  final SnackbarService _snackbarService = locator.get();
  final DialogService _dialogService = locator.get();

  final ImagePicker _imagePicker = ImagePicker();
  final PostType type;
  final controls = _Controls();

  late final FormGroup form;

  List<XFile?> _attachments = [null];
  bool _isMalePartner = true;
  bool _isFemalePartner = true;
  LocationEntity? _selectedLocation;

  CreatePostViewModel(this.type) {
    switch (type) {
      case PostType.booked:
        form = FormGroup({
          controls.attachments:
              FormControl(validators: [_validatorAttachments]),
          controls.location: FormControl(validators: [Validators.required]),
          controls.date:
              FormControl<DateTimeRange>(validators: [Validators.required]),
          controls.hotel:
              FormControl<String>(validators: [Validators.required]),
          controls.rating:
              FormControl<double>(validators: [Validators.required]),
          controls.price:
              FormControl<double>(validators: [Validators.required]),
          controls.message:
              FormControl<String>(validators: [Validators.required]),
        });
        break;
      case PostType.finding:
        form = FormGroup({
          controls.location: FormControl(validators: [Validators.required]),
          controls.date:
              FormControl<DateTimeRange>(validators: [Validators.required]),
          controls.price: FormControl<double>(),
          controls.message:
              FormControl<String>(validators: [Validators.required]),
          controls.hourly: FormControl<bool>(),
        });
        break;
    }
  }

  //region getters setters

  bool get isMalePartner => _isMalePartner;

  set isMalePartner(bool isMalePartner) {
    _isMalePartner = isMalePartner;
    notifyListeners();
  }

  bool get isFemalePartner => _isFemalePartner;

  set isFemalePartner(bool isFemalePartner) {
    _isFemalePartner = isFemalePartner;
    notifyListeners();
  }

  List<XFile?> get attachments => _attachments;

  set attachments(List<XFile?> attachments) {
    _attachments = attachments;
    notifyListeners();
  }

  //endregion

  /// Validates that attachment control's attachment count should
  /// be minimum 1 or maximum 3
  Map<String, dynamic>? _validatorAttachments(
      AbstractControl<dynamic> control) {
    return attachments.isNotEmpty &&
            (attachments.where((element) => element != null).isNotEmpty &&
                attachments.where((element) => element != null).length <= 3)
        ? null
        : {'Minimum 1 or maximum 3 pictures must attach': true};
  }

  double get partnerAmount =>
      (double.tryParse(form.control(controls.price).value.toString()) ?? 0) / 2;

  void onTapMalePartner(bool val) => isMalePartner = !val;

  void onTapFemalePartner(bool val) => isFemalePartner = !val;

  void onSubmit() async {
    form.markAsUntouched();
    if (form.valid) {
      setBusy(true);
      try {
        switch (type) {
          case PostType.booked:
            await _postsService.createPost(
              name: form.control(controls.hotel).value,
              gender: _getGender(),
              location: _selectedLocation!.id,
              notes: form.control(controls.message).value,
              partnerAmount: form.control(controls.price).value as double,
              rate: form.control(controls.rating).value as double,
              attachments: attachments
                  .where((element) => element != null)
                  .map((e) => e!)
                  .toList(growable: false),
            );
            break;
          case PostType.finding:
            await _postsService.createPost(
              name: 'dummy',
              gender: _getGender(),
              location: _selectedLocation!.id,
              notes: form.control(controls.message).value,
              partnerAmount: form.control(controls.price).value,
            );
            break;
        }

        await _dialogService.showDialog(
          
            title: 'Create Post',
            description: 'Your post has been successfully created.');

        _navigationService.back();
      } catch (e) {
        _snackbarService.showSnackbar(message: e.toString());
      }
      setBusy(false);
    } else {
      form.markAllAsTouched();
    }
  }

  String _getGender() {
    if (_isMalePartner && _isFemalePartner) {
      return 'male/female';
    } else if (_isFemalePartner) {
      return 'female';
    } else {
      return 'male';
    }
  }

  void onPressedRemove(int index) {
    var att =
        List<XFile?>.from(attachments.where((element) => element != null));
    att.removeAt(index);

    int remaining = 3 - att.length;
    if (remaining > 0) {
      att.add(null);
    }

    attachments = att;
    form.control(controls.attachments).value = attachments;
  }

  void onPressedAdd() async {
    var att =
        List<XFile?>.from(attachments.where((element) => element != null));

    if (att.length < 2) {
      var res = await _imagePicker.pickMultiImage();

      if (res.isListNotEmptyOrNull) {
        int remaining = 3 - att.length;
        att.addAll(res!.take(remaining));

        remaining = 3 - att.length;
        if (remaining > 0) {
          att.add(null);
        }

        attachments = att;
      }
    } else {
      var res = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        var att = List<XFile?>.from(attachments);
        att.removeLast();
        att.add(res);

        int remaining = 3 - att.length;
        if (remaining > 0) {
          att.add(null);
        }

        attachments = att;
      }
    }

    form.control(controls.attachments).value = attachments;
  }

  void onLocation(FormControl control) {
    _navigationService.navigateToLocationChangeView().then((value) {
      if (value is LocationEntity) {
        _selectedLocation = value;
        control.value = value.name;
      }
    });
  }
}

class _Controls {
  String get location => 'location';

  String get date => 'date';

  String get hotel => 'hotel';

  String get rating => 'rating';

  String get price => 'price';

  String get message => 'message';

  String get hourly => 'hourly';

  String get attachments => 'attachments';
}
