import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/Utils/constants.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/enums/day_night_enum.dart';
import 'package:cheffy/core/enums/day_week_enum.dart';
import 'package:cheffy/modules/main/discover/domain/entities/booking_hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_details.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_location_entity.dart';
import 'package:cheffy/modules/main/discover/domain/repositories/search_repo.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchProvider extends BaseViewModel {
  final SearchRepo searchRepo;
  final NavigationService _navigationService = locator.get();
  final BottomSheetService _bottomSheetService = locator.get();

  HotelLocationEntity? selectedLocationEntity;

  List<HotelLocationEntity> filteredHotelLocations = [];
  List<BookingHotelEntity> filteredHotels = [];

  bool isLoading = false;

  // Search location Page Form
  late final FormGroup searchLocationForm;

  // Search Time Page Form
  // late final FormGroup filterSearchForm;

  // Whether the switch button is
  // Hourly Basis: false
  // Full day: true
  bool isFullDay = false;

  // Selected (Day / Week) Choice
  DayWeek dayWeek = DayWeek.Day;

  // Selected (Day / Week) Choice
  DayNight dayNight = DayNight.Day;

  // Room suit types
  bool isFullBoard = false;
  bool isHalfBoard = false;
  bool isBedAndBreakfast = false;
  bool isRoomOnly = false;

  double minPrice = 0.0;
  double maxPrice = 1000.0;
  late RangeValues priceRange;

  // Hotel Details Screen
  late final GoogleMapController _controller;
  BookingHotelDetailsEntity? hotelDetails;

  SearchProvider(this.searchRepo) {
    // Initializes price range slider
    priceRange = RangeValues(minPrice, maxPrice);

    searchLocationForm = FormGroup({
      ReactiveFormControls.searchLocation: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      ReactiveFormControls.searchRoomsNumber: FormControl<int>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      ReactiveFormControls.searchAdultsNumber: FormControl<int>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      ReactiveFormControls.searchCheckInDate: FormControl<DateTime>(
        validators: [
          Validators.required,
        ],
      ),
      ReactiveFormControls.searchCheckOutDate: FormControl<DateTime>(
        validators: [
          Validators.required,
        ],
      ),
    });

    // filterSearchForm = FormGroup({
    //   ReactiveFormControls.searchRoomsNumber: FormControl<int>(
    //     validators: [
    //       Validators.required,
    //       Validators.number,
    //       Validators.max<int>(maxRoomsNumber),
    //     ],
    //   ),
    //   ReactiveFormControls.searchHourRangeStart: FormControl<int>(
    //     validators: [
    //       Validators.required,
    //     ],
    //   ),
    //   ReactiveFormControls.searchHourRangeEnd: FormControl<int>(
    //     validators: [
    //       Validators.required,
    //     ],
    //   ),
    //   ReactiveFormControls.searchCheckInDate: FormControl<DateTime>(
    //     validators: [
    //       Validators.required,
    //     ],
    //   ),
    //   ReactiveFormControls.searchCheckOutDate: FormControl<DateTime>(
    //     validators: [
    //       Validators.required,
    //     ],
    //   ),
    //   ReactiveFormControls.searchStartTime: FormControl<DateTime>(
    //     validators: [
    //       Validators.required,
    //     ],
    //   ),
    //   ReactiveFormControls.searchEndTime: FormControl<DateTime>(
    //     validators: [
    //       Validators.required,
    //     ],
    //   ),
    // });
  }

  void switchHourlyBasisOrFullDay(bool? isOn) {
    if (isOn != null) {
      isFullDay = isOn;
      notifyListeners();
    }
  }

  void onPriceSliderRangeChange(RangeValues values) {
    priceRange = values;
    notifyListeners();
  }

  void onSearchHotels() {
    _navigationService.navigateTo(Routes.hotelsSelectionView);
  }

  void onSearchedLocationSelection(
      HotelLocationEntity? selectedSearchedLocation) {
    if (selectedSearchedLocation != null) {
      _navigationService.back();
      selectedLocationEntity = selectedSearchedLocation;
      searchLocationForm.control(ReactiveFormControls.searchLocation).value =
          selectedSearchedLocation.label;
      notifyListeners();
    }
  }

  Future<void> getHotelsLocation(String searchQuery) async {
    EasyDebounce.debounce(
      DebounceTags.hotelsDebouncer,
      Duration(milliseconds: DebounceTags.debouncerDurationInMillis),
      () async {
        if (searchQuery.isNotEmpty) {
          try {
            setBusyForObject(filteredHotelLocations, true);
            filteredHotelLocations =
                await searchRepo.getHotelsLocationByName(searchQuery);
            notifyListeners();
          } catch (e) {
            print(e);
          } finally {
            setBusyForObject(filteredHotelLocations, false);
          }
        }
      },
    );
  }

  Future<void> onSearchLocationSubmit() async {
    if (searchLocationForm.valid) {
      try {
        setBusyForObject(filteredHotels, true);
        filteredHotels = await searchRepo.getFilteredHotels(
          hotelLocation: selectedLocationEntity!,
          checkInDate: UniversalVariables.bookingApiDateFormat.format(
              searchLocationForm
                  .control(ReactiveFormControls.searchCheckInDate)
                  .value as DateTime),
          checkOutDate: UniversalVariables.bookingApiDateFormat.format(
              searchLocationForm
                  .control(ReactiveFormControls.searchCheckOutDate)
                  .value as DateTime),
          roomsNo: searchLocationForm
              .control(ReactiveFormControls.searchRoomsNumber)
              .value,
          adultsNo: searchLocationForm
              .control(ReactiveFormControls.searchAdultsNumber)
              .value,
        );
        _navigationService.navigateTo(Routes.searchHotelsView);
      } catch (e) {
        print(e);
      } finally {
        setBusyForObject(filteredHotels, false);
      }
    } else {
      print('Not valid (onSearchLocationSubmit)');
      searchLocationForm.markAllAsTouched();
    }
  }

  void onSearchFilterResultSubmit() {
    _navigationService.navigateTo(Routes.searchHotelsView);
  }

  void onDayweekChoice(DayWeek dayWeekChoice) {
    dayWeek = dayWeekChoice;
    notifyListeners();
  }

  void onDayNightChoice(DayNight dayNightChoice) {
    dayNight = dayNightChoice;
    notifyListeners();
  }

  void switchFullBoard(bool? isActive) {
    if (isActive != null) {
      isFullBoard = isActive;
    }
    notifyListeners();
  }

  void switchHalfBoard(bool? isActive) {
    if (isActive != null) {
      isHalfBoard = isActive;
    }
    notifyListeners();
  }

  void switchBedAndBreakfast(bool? isActive) {
    if (isActive != null) {
      isBedAndBreakfast = isActive;
    }
    notifyListeners();
  }

  void switchRoomOnly(bool? isActive) {
    if (isActive != null) {
      isRoomOnly = isActive;
    }
    notifyListeners();
  }

  void onSearchedHotelPress(BookingHotelEntity bookingHotel) {
    _navigationService.navigateTo(
      Routes.hotelDetailsView,
      arguments: HotelDetailsViewArguments(hotel: bookingHotel),
    );
  }

  // Hotel Details Screen
  Future<void> getHotelDetails(int hotelId) async {
    try {
      setBusyForObject(hotelDetails, true);
      hotelDetails = null; // Reset the old value
      hotelDetails = await searchRepo.getHotelDetailsById(hotelId);
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      setBusyForObject(hotelDetails, false);
    }
  }

  void onHotelDetailsPressedBack() {
    _navigationService.back();
    _controller.dispose();
  }

  void onMapCreated(GoogleMapController controller) {
    // It will only be called when the request is done successfully
    _controller = controller;
    animateCamera(
      LatLng(
        hotelDetails!.location!.lat,
        hotelDetails!.location!.lon,
      ),
    );
  }

  Future<void> animateCamera(LatLng latLng) async {
    await _controller.animateCamera(
      CameraUpdate.newLatLngZoom(
        latLng,
        mapZoomValue,
      ),
    );
  }

  Future<void> onTapBookNow({
    required BookingHotelEntity hotel,
    required BookingHotelDetailsEntity hotelDetails,
  }) async {
    // Book a hotel
    try {
      searchRepo.createBooking(
        hotelId: hotel.hotelId,
        district: hotelDetails.districtId!.toString(),
        hotelName: hotelDetails.name ?? '',
        country: hotelDetails.country ?? '',
        city: hotelDetails.city ?? '',
        isVacationRental: hotelDetails.isVacationRental ?? 0,
        childrenNotAllowed: hotel.childrenNotAllowed ?? 0,
        minrate: hotelDetails.minrate ?? 0,
        maxrate: hotelDetails.maxrate ?? 0,
        url: hotelDetails.url ?? '',
        address: hotelDetails.address ?? '',
        countrycode: hotelDetails.countrycode ?? '',
        email: hotelDetails.email ?? '',
        reviewScore: double.tryParse(hotelDetails.reviewScore ?? '0.0') ?? 0.0,
        reviewScoreWord: hotelDetails.reviewScoreWord ?? '',
        currencycode: hotelDetails.currencycode ?? '',
        accommodationTypeName: hotel.accommodationTypeName ?? '',
        distance: hotel.distanceToCcFormatted ?? '0.0',
        isFreeCancellable: hotel.isFreeCancellable ?? 0,
        mainPhotoUrl: hotel.mainPhotoUrl ?? '',
        zip: hotelDetails.zip ?? '',
        latitude: hotelDetails.location?.lat ?? 0.0,
        longitude: hotelDetails.location?.lon ?? 0.0,
        entrancePhotoUrl: hotelDetails.entrancePhotoUrl ?? '',
        checkin: hotelDetails.checkin!,
        checkout: hotelDetails.checkout!,
        amount: hotel.minTotalPrice ?? 0.0, // TODO: Double check
        currency: hotelDetails.currencycode ?? '',
        checkInDate: UniversalVariables.bookingApiDateFormat.format(
              searchLocationForm
                  .control(ReactiveFormControls.searchCheckInDate)
                  .value as DateTime),
        checkOutDate: UniversalVariables.bookingApiDateFormat.format(
              searchLocationForm
                  .control(ReactiveFormControls.searchCheckOutDate)
                  .value as DateTime),
        noOfRooms: searchLocationForm
              .control(ReactiveFormControls.searchRoomsNumber)
              .value,
        roomType: roomType,
        paymentOption: hotelDetails,
        bookingStatus: bookingStatus,
      );
    } catch (e) {
      print(e);
    }
  }
}
