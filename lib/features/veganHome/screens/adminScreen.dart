import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/admin.dart';
import 'package:vegan_liverpool/utils/url.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AdminViewModel>(
        converter: AdminViewModel.fromStore,
        builder: (_, viewmodel) {
          return MyScaffold(
            title: "Admin",
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Admin Settings",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SwitchListTile(
                      activeColor:
                          Theme.of(context).buttonTheme.colorScheme?.primary ??
                              themeShade600,
                      contentPadding: const EdgeInsets.all(0),
                      value:
                          viewmodel.adminSettings?.isTestMerchantMode ?? false,
                      title: Text("Test merchant mode"),
                      onChanged: (val) {
                        if (val) {
                          viewmodel.setAppTestMerchantMode();
                        } else {
                          viewmodel.setAppConsumerMode();
                        }
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => launchUrl(
                                "https://www.instagram.com/vegi_liverpool/"),
                            icon: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.grey[400],
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                launchUrl("https://vm.tiktok.com/ZMNF3ekHX/"),
                            icon: Icon(
                              FontAwesomeIcons.tiktok,
                              color: Colors.grey[400],
                              size: 28,
                            ),
                          ),
                          IconButton(
                            onPressed: () => launchUrl("https://vegiapp.co.uk"),
                            icon: Icon(
                              Icons.launch,
                              color: Colors.grey[400],
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
