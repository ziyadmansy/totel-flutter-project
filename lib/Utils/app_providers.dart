import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:provider/provider.dart';

final appProviders = [
  ChangeNotifierProvider(create: (_) => PaymentViewModel()),
];
