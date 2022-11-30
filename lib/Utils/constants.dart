import 'package:cheffy/app/app.dart';

List<String> parkingOptions = [
  'Free Parking',
  'Paid Parking',
  'No Parking Available',
];

const double mapZoomValue = 16.0;

const String rapidApiLocale = 'en-us';
const String rapidApiMeasuringUnit = 'metric';
const String rapidApiOrder = 'popularity';
const bool includeNearbyPlaces = true;
const String filterCurrency = 'USD';

final Map<String, String> hotelsHeaders = {
  'X-RapidAPI-Key': Application.rapidApiKey,
  'X-RapidAPI-Host': Application.rapidApiHost,
};
