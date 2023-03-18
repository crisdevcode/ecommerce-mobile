import 'package:amplify_api/amplify_api.dart';
import 'package:get/get.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:delivery_ecommerce/amplifyconfiguration.dart';
import 'package:delivery_ecommerce/models/ModelProvider.dart';

class Controller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    // Add the following lines to your app initialization to add the DataStore plugin
    final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);

    final api = AmplifyAPI();
    await Amplify.addPlugins([datastorePlugin, api]);

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
    }
  }
}