import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_finding_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/repositories/post_repo.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/enums/post_type.dart';
import 'package:cheffy/core/methods/extensions.dart';

class CreatePostViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final SnackbarService _snackbarService = locator.get();
  final DialogService _dialogService = locator.get();
  final PostRepo _postsRepo;

  final ImagePicker _imagePicker = ImagePicker();

  final controls = _Controls();

  late final FormGroup form;

  List<XFile> _attachments = <XFile>[];
  bool _isMalePartner = false;
  bool _isFemalePartner = false;

  List<HotelEntity> filteredHotels = [];
  HotelEntity? selectedHotel;

  CreatePostViewModel(this._postsRepo) {
    form = FormGroup({
      controls.attachments: FormControl(validators: [_validatorAttachments]),
      controls.date:
          FormControl<DateTimeRange>(validators: [Validators.required]),
      controls.price: FormControl<double>(validators: [Validators.required]),
      controls.message: FormControl<String>(validators: [Validators.required]),
      controls.hourly: FormControl<bool>(),
    });

    // form = FormGroup({
    //   controls.location: FormControl(validators: [Validators.required]),
    //   controls.date:
    //       FormControl<DateTimeRange>(validators: [Validators.required]),
    //   controls.price: FormControl<double>(),
    //   controls.message: FormControl<String>(validators: [Validators.required]),
    //   controls.hourly: FormControl<bool>(),
    // });
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

  List<XFile> get attachments => _attachments;

  set attachments(List<XFile> attachments) {
    _attachments = attachments;
    notifyListeners();
  }

  //endregion

  /// Validates that attachment control's attachment count should
  /// be minimum 1 or maximum 3
  Map<String, dynamic>? _validatorAttachments(
      AbstractControl<dynamic> control) {
    return attachments.isNotEmpty && (attachments.length <= 3)
        ? null
        : {'Minimum 1 or maximum 3 pictures must be attached': true};
  }

  double get partnerAmount =>
      (double.tryParse(form.control(controls.price).value.toString()) ?? 0) / 2;

  void onTapMalePartner(bool? val) => isMalePartner = val!;

  void onTapFemalePartner(bool? val) => isFemalePartner = val!;

  Future<void> onSubmit(PostType type) async {
    if (form.valid && selectedHotel != null) {
      setBusy(true);
      try {
        await _postsRepo.createFindingPost(
          CreateFindingPostParams(
            hotelId: selectedHotel!.id,
            partnerGender: _getGender(),
            location: selectedHotel!.address ?? '',
            partnerMessage: form.control(controls.message).value,
            partnerAmount: form.control(controls.price).value,
            startDate:
                (form.control(controls.date).value as DateTimeRange).start,
            endDate: (form.control(controls.date).value as DateTimeRange).end,
            isHourly: form.control(controls.hourly).value,
            postType: type,
            paymentAmountPerNight: double.tryParse(
                    form.control(controls.price).value.toString()) ??
                0,
            attachments: attachments,
          ),
        );

        /*switch (type) {
          case PostType.booked:
            final selectedAttachments = attachments
                .where((element) => element != null)
                .map((e) => e!)
                .toList(growable: false);

            await _postsRepo.createBookedPost(
              CreateBookedPostParams(
                bidEnds: form.control(controls.date).value!.end,
                bidStart: form.control(controls.date).value!.start,
                hotel: form.control(controls.hotel).value,
                checkIn: 'form.control(controls.date).value!.start',
                checkout: 'form.control(controls.date).value!.end',
                lat: _selectedLocation!.latitude,
                long: _selectedLocation!.longitude,
                name: form.control(controls.hotel).value,
                gender: _getGender(),
                overview: form.control(controls.message).value,
                location: _selectedLocation!.id.toString(),
                notes: form.control(controls.message).value,
                partnerAmount: form.control(controls.price).value as double,
                rate: form.control(controls.rating).value as double,
                dateFrom: form.control(controls.date).value.start,
                dateTo: form.control(controls.date).value.end,
              ),
              files: selectedAttachments,
            );
            break;
          case PostType.finding:
            await _postsRepo.createFindingPost(
              CreateFindingPostParams(
                gender: _getGender(),
                location: _selectedLocation!.id.toString(),
                notes: form.control(controls.message).value,
                partnerAmount: form.control(controls.price).value,
                startDate: form.control(controls.date).value.start,
                endDate: form.control(controls.date).value.end,
                isAcceptHourly: form.control(controls.hourly).value,
              ),
            );
            break;
        }*/

        await _dialogService.showDialog(
          title: 'Success',
          description: 'Your post has been created successfully.',
        );

        _navigationService.back();
      } catch (e) {
        _snackbarService.showSnackbar(message: e.toString());
        rethrow;
      } finally {
        setBusy(false);
      }
    } else {
      form.markAllAsTouched();
      if (selectedHotel == null) {
        _snackbarService.showSnackbar(message: 'Select a hotel');
      }
    }
  }

  Future<void> getFilteredHotels(String searchQuery) async {
    EasyDebounce.debounce(
      DebounceTags.hotelsDebouncer,
      Duration(milliseconds: DebounceTags.debouncerDurationInMillis),
      () async {
        if (searchQuery.isNotEmpty) {
          try {
            setBusyForObject(filteredHotels, true);
            filteredHotels = await _postsRepo.getFilteredHotels(searchQuery);
            notifyListeners();
          } catch (e) {
            print(e);
          } finally {
            setBusyForObject(filteredHotels, false);
          }
        }
      },
    );
  }

  String _getGender() {
    if (_isMalePartner && _isFemalePartner) {
      return 'Male/Female';
    } else if (_isFemalePartner) {
      return 'Female';
    } else {
      return 'Male';
    }
  }

  String _getPostType(PostType type) {
    if (type == PostType.finding) {
      return 'Finding Partner';
    } else {
      return 'Already Booked';
    }
  }

  void onPressedRemove(int index) {
    attachments.removeAt(index);

    form.control(controls.attachments).value = attachments;
    notifyListeners();
  }

  void onPressedAdd() async {
    if (attachments.length < 3) {
      var res = await _imagePicker.pickMultiImage();

      if (res.isListNotEmptyOrNull) {
        int remaining = 3 - attachments.length;
        attachments.addAll(res.take(remaining));
      }
    } else {
      var res = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        attachments.removeLast();
        attachments.add(res);
      }
    }

    form.control(controls.attachments).value = attachments;

    notifyListeners();
  }

  void onAddHotelPress() {
    _navigationService.navigateTo(Routes.hotelsSelectionView);
  }

  void onSearchedHotelSelection(HotelEntity? selectedSearchedHotel) {
    if (selectedSearchedHotel != null) {
      _navigationService.back();
      selectedHotel = selectedSearchedHotel;
      notifyListeners();
    }
  }
}

class _Controls {
  String get date => 'date';

  String get price => 'price';

  String get message => 'message';

  String get hourly => 'hourly';

  String get attachments => 'attachments';
}
