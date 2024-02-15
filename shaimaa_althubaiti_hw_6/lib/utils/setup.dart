import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shaimaa_althubaiti_hw_6/data/persons_data.dart';

Future<void> setup() async {
  await GetStorage.init();
  GetIt.instance;
  GetIt.I.registerSingleton<PersonsData>(PersonsData());
}