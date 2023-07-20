import 'package:todo_app/common/export/export.dart';

class AppConsts {
  AppConsts._();
  static const double kRadius = AppSizes.s15;
  static const String empty = '';
}

String TITLE = '';
String DESCRIPTION = '';
Country COUNTRYBASE = Country(
  phoneCode: '48',
  countryCode: 'PL',
  e164Sc: 0,
  geographic: true,
  level: 1,
  name: 'Poland',
  example: 'Poland',
  displayName: 'Poland',
  displayNameNoCountryCode: 'PL',
  e164Key: '',
);
