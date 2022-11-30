import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/Utils/shared_core.dart';
import 'package:cheffy/core/exceptions/location_exception.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/profile/profile/domain/entities/booking_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/category_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_finding_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_share_room_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/room_facility_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/repositories/post_repo.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/methods/extensions.dart';

class CreatePostViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final SnackbarService _snackbarService = locator.get();
  final DialogService _dialogService = locator.get();
  final PostRepo _postsRepo;

  final ImagePicker _imagePicker = ImagePicker();

  final controls = _Controls();

  late final FormGroup shareRoomForm;
  late final FormGroup findingPartnerForm;

  List<XFile> _attachments = <XFile>[];
  bool _isMalePartner = false;
  bool _isFemalePartner = false;

  // List<HotelEntity> filteredHotels = [];
  // HotelEntity? selectedHotel;

  BookingEntity? selectedBookingHotel;

  // Check boxes of Facilities
  List<RoomFacilityEntity> generalFacilities = [
    RoomFacilityEntity(
      name: 'Air conditioning',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Heating',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Free Wifi',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Electric vehicle charging station',
      isChecked: false,
    ),
  ];
  List<RoomFacilityEntity> cookingAndCleaningFacilities = [
    RoomFacilityEntity(
      name: 'Kitchen',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Kitchenette',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Washing Machine',
      isChecked: false,
    ),
  ];
  List<RoomFacilityEntity> entertainmentFacilities = [
    RoomFacilityEntity(
      name: 'Flat-Screen TV',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Swimming Pool',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Hot tub',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Mini bar',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Sauna',
      isChecked: false,
    ),
  ];
  List<RoomFacilityEntity> outsideAndViewFacilities = [
    RoomFacilityEntity(
      name: 'Balcony',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Garden View',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Terrace',
      isChecked: false,
    ),
  ];
  List<RoomFacilityEntity> houseRulesFacilities = [
    RoomFacilityEntity(
      name: 'Smoking allowed',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Pets allowed',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Children allowed',
      isChecked: false,
    ),
    RoomFacilityEntity(
      name: 'Parties/Events allowed',
      isChecked: false,
    ),
  ];

  CreatePostViewModel(this._postsRepo) {
    shareRoomForm = FormGroup({
      controls.category: FormControl<int>(
        validators: [Validators.required],
      ),
      controls.message: FormControl<String>(validators: [Validators.required]),
      controls.hourlyOrDaily: FormControl<bool>(),
      controls.nameOfProperty:
          FormControl<String>(validators: [Validators.required]),
      controls.country: FormControl<String>(validators: [Validators.required]),
      controls.address: FormControl<String>(validators: [Validators.required]),
      controls.parking: FormControl<String>(validators: [Validators.required]),
      controls.checkInTimeFrom:
          FormControl<DateTime>(validators: [Validators.required]),
      controls.checkInTimeTo:
          FormControl<DateTime>(validators: [Validators.required]),
      controls.roomSetup:
          FormControl<String>(validators: [Validators.required]),
      controls.noOfGuestsAllowed:
          FormControl<int>(validators: [Validators.required]),
      controls.noOfBathrooms:
          FormControl<int>(validators: [Validators.required]),
      controls.pricePerGroupSize:
          FormControl<double>(validators: [Validators.required]),
      controls.chargePerNight:
          FormControl<double>(validators: [Validators.required]),
    });

    findingPartnerForm = FormGroup({
      controls.messageToPartner: FormControl<String>(
        validators: [Validators.required],
      ),
      controls.selectedBooking: FormControl(
        validators: [
          // _validatorSelectedBooking,
        ],
      ),
      controls.partnerGender: FormControl(
        validators: [
          // _validatorPartnerGender,
        ],
      ),
    });
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

  /// Validates that attachment control's attachment count should
  /// be minimum 1 or maximum 3
  Map<String, dynamic>? _validatorAttachments(
      AbstractControl<dynamic> control) {
    return attachments.isNotEmpty && (attachments.length <= 3)
        ? null
        : {'Minimum 1 or maximum 3 pictures must be attached': true};
  }

  /// Validates the booking if it is selected
  Map<String, dynamic>? _validatorSelectedBooking(
      AbstractControl<dynamic> control) {
    return (selectedBookingHotel != null)
        ? null
        : {'Select a booked hotel': true};
  }

  /// Validates the booking partner gender to be at least one is selected
  Map<String, dynamic>? _validatorPartnerGender(
      AbstractControl<dynamic> control) {
    return (isMalePartner || isFemalePartner)
        ? null
        : {'Select at least one gender for partner': true};
  }

  double get partnerAmount =>
      (double.tryParse(shareRoomForm
              .control(controls.chargePerNight)
              .value
              .toString()) ??
          0) /
      2;

  void onTapMalePartner(bool? val) => isMalePartner = val!;

  void onTapFemalePartner(bool? val) => isFemalePartner = val!;

  void resetPostingFields() {
    selectedBookingHotel = null;
    // selectedHotel = null;
    isMalePartner = false;
    isFemalePartner = false;
    notifyListeners();
  }

  Future<void> onFindingPartnerPostSubmit() async {
    if (findingPartnerForm.valid && selectedBookingHotel != null) {
      setBusy(true);
      try {
        await _postsRepo.createFindingPost(
          CreateFindingPartnerPostParams(
            bookingId: selectedBookingHotel!.id,
            partnerGender: _getGender(),
            messageToPartner:
                findingPartnerForm.control(controls.messageToPartner).value,
          ),
        );

        _navigationService.back();

        _snackbarService.showSnackbar(
          title: 'Success',
          message: 'Post created successfully',
        );

        resetPostingFields();
      } catch (e) {
        print(e);
        _snackbarService.showSnackbar(
          title: 'Error',
          message: 'Something went wrong, please try again',
        );
        rethrow;
      } finally {
        setBusy(false);
      }
    } else {
      findingPartnerForm.markAllAsTouched();
      if (selectedBookingHotel == null) {
        _snackbarService.showSnackbar(message: 'Select your booked hotel');
      }
    }
  }

  Future<LatLng> getLocation() async {
    try {
      await SharedCore.checkLocationPermissions();
      LocationData position = await SharedCore.getLocationData();

      print(position.longitude);
      print(position.latitude);

      print('initial Location Got successfully');

      return LatLng(position.latitude!, position.longitude!);
    } on LocationException catch (e) {
      _snackbarService.showSnackbar(
        message:
            'Location is not enabled, please accept the permission and enable then try again',
      );
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onShareRoomPostSubmit() async {
    if (shareRoomForm.valid) {
      setBusy(true);
      final latLng = await getLocation();
      try {
        await _postsRepo.createShareRoomPost(
          CreateSharedRoomPostParams(
            categoryId: shareRoomForm.control(controls.category).value,
            nameOfProperty:
                shareRoomForm.control(controls.nameOfProperty).value,
            country: shareRoomForm.control(controls.country).value,
            address: shareRoomForm.control(controls.address).value,
            longitude: latLng.longitude,
            latitude: latLng.latitude,
            checkInFrom: UniversalVariables.timeFormat24.format(shareRoomForm
                .control(controls.checkInTimeFrom)
                .value as DateTime),
            checkInTo: UniversalVariables.timeFormat24.format(shareRoomForm
                .control(controls.checkInTimeTo)
                .value as DateTime),
            roomSetup: shareRoomForm.control(controls.roomSetup).value,
            parking: shareRoomForm.control(controls.parking).value,
            message: shareRoomForm.control(controls.message).value,
            noOfAllowedGuests:
                shareRoomForm.control(controls.noOfGuestsAllowed).value,
            noOfBathrooms: shareRoomForm.control(controls.noOfBathrooms).value,
            generalFacilities: generalFacilities
                .where((fac) => fac.isChecked)
                .map((fac) => fac.name)
                .toList(),
            cookingCleaningFacilities: cookingAndCleaningFacilities
                .where((fac) => fac.isChecked)
                .map((fac) => fac.name)
                .toList(),
            entertainmentFacilities: entertainmentFacilities
                .where((fac) => fac.isChecked)
                .map((fac) => fac.name)
                .toList(),
            outsideViewFacilities: outsideAndViewFacilities
                .where((fac) => fac.isChecked)
                .map((fac) => fac.name)
                .toList(),
            houseRulesFacilities: houseRulesFacilities
                .where((fac) => fac.isChecked)
                .map((fac) => fac.name)
                .toList(),
            pricePerGroupSize:
                shareRoomForm.control(controls.pricePerGroupSize).value,
            chargePerNight:
                shareRoomForm.control(controls.chargePerNight).value,
            isChargeHourly: shareRoomForm.control(controls.hourlyOrDaily).value,
          ),
        );

        _navigationService.back();

        _snackbarService.showSnackbar(
          title: 'Success',
          message: 'Post created successfully',
        );

        resetPostingFields();
      } catch (e) {
        print(e);
        _snackbarService.showSnackbar(
          title: 'Error',
          message: 'Something went wrong, please try again',
        );
        rethrow;
      } finally {
        setBusy(false);
      }
    } else {
      shareRoomForm.markAllAsTouched();
    }
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

  Future<void> onAddBookingPress() async {
    selectedBookingHotel = await _navigationService
        .navigateTo(Routes.bookingsView) as BookingEntity?;
    notifyListeners();
    print('selected booking: $selectedBookingHotel');
  }
}

class _Controls {
  String get message => 'message';

  String get hourlyOrDaily => 'hourly';

  String get selectedBooking => 'selectedBooking';
  String get messageToPartner => 'messageToPartner';
  String get partnerGender => 'partnerGender';

  // Share room controls
  String get category => 'category';
  String get nameOfProperty => 'nameOfProperty';
  String get country => 'country';
  String get address => 'address';
  String get latitude => 'latitude';
  String get longitude => 'longitude';
  String get checkInTimeFrom => 'checkInTimeFrom';
  String get checkInTimeTo => 'checkInTimeTo';
  String get roomSetup => 'roomSetup';
  String get noOfGuestsAllowed => 'noOfGuestsAllowed';
  String get noOfBathrooms => 'noOfBathrooms';
  String get generalFacilities => 'generalFacilities';
  String get cookingCleaningFacilities => 'cookingCleaningFacilities';
  String get entertainmentFacilities => 'entertainmentFacilities';
  String get parking => 'parking';
  String get houseRules => 'houseRules';
  String get pricePerGroupSize => 'pricePerGroupSize';
  String get chargePerNight => 'chargePerNight';
}
