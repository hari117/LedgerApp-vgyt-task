

import 'package:get_it/get_it.dart';
import 'package:ledgerapp/useraccoutmodel.dart';

GetIt loc=GetIt.instance;

setup()
{
  print("registed singleton class");
  loc.registerSingleton<UserAccountModel>(UserAccountModel());
}