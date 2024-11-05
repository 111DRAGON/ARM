import 'package:arm/core/utils/custom_navigation.dart';
import 'package:arm/features/auth_feature/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../accounts_feature/presentation/pages/region_accounts_view.dart';
import '../../../announcement_features/presentation/pages/get_announcements_view.dart';
import '../../../business_features/presentation/pages/get_activation_business_licence_view.dart';
import '../../../business_features/presentation/pages/get_activation_business_view.dart';
import '../../../business_features/presentation/pages/my_places_view.dart';
import '../../../notification_feature/presentation/pages/get_notification_view.dart';
import '../../../offers_feature/presentation/pages/get_offer_view.dart';
import '../widgets/home_view_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("الصفحة الرئيسية"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: GridView.count(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 25,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
            children: [

             HomeViewCard(
                text: 'تسجيل دخول',
                icon: Icons.login,
                onTap: () {
                  context.push(
                    const LoginView(),
                  );
                },
              ),HomeViewCard(
                text: 'أماكنى',color: Colors.black,
                icon: FontAwesomeIcons.shop,
                onTap: () {
                   context.push(const MyPlacesView());
                },
              ),
             HomeViewCard(
                text: 'قبول مبدئى للأماكن الجديده',color: Colors.orangeAccent,
                icon: Icons.done,
                onTap: () {
                  context.push(
                    const GetActivationBusinessView(),
                  );
                },
              ),
             HomeViewCard(
                text: 'قبول نهائى للأماكن الجديده',
                icon: Icons.offline_pin_outlined,color: Colors.green,
                onTap: () {
                  context.push(
                    const GetActivationBusinessLicenceView(),
                  );
                },
              ),
             HomeViewCard(
                text: 'الموافقه على الإعلانات الجديدة',color: Colors.amber,
                icon: Icons.announcement,
                onTap: () {
                   context.push(const GetActivationAnnouncementsView());
                },
              ),
             HomeViewCard(
                text: 'الموافقه على العروض الجديدة',
                icon: Icons.local_offer,color: Colors.yellow,
                onTap: () {
                  context.push(const GetActivationOfferView( ));
                },
              ),
             HomeViewCard(
                text: 'الموافقه على الإشعارات الجديدة',color: Colors.blue,
                icon: Icons.notification_important_outlined,
                onTap: () {
                   context.push(const GetActivationNotificationView());
                },
              ),

             HomeViewCard(
                text: 'الحسابات',color: Colors.red,
                icon: Icons.account_balance_wallet_outlined,
                onTap: () {
                  context.push(
                    const RegionAccountsView(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
