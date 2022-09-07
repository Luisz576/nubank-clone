import 'package:flutter/material.dart';
import 'package:nubank/models/user_data.dart';
import 'package:nubank/notifiers/simple_notifier.dart';
import 'package:nubank/screens/login_screen.dart';
import 'package:nubank/services/api.dart';
import 'package:nubank/services/database.dart';
import 'package:nubank/utils/app_colors.dart';
import 'package:nubank/widgets/home/home_account_cash_and_options.dart';
import 'package:nubank/widgets/home/home_app_bar.dart';
import 'package:nubank/widgets/home/home_credit_card_info.dart';
import 'package:nubank/widgets/large_simple_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SimpleNotifier<bool> visibleNotifier = SimpleNotifier(false); //could implement a database to get and save preferences
  final SimpleNotifier<UserData> userDataNotifier = SimpleNotifier(UserData.empty());
  
  bool loadingInitialUserData = true;
  
  @override
  void initState(){
    super.initState();
    Database.getUserToken().then((token){
      if(token == null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) => const LoginScreen()
        ), (route) => false);
        return;
      }
      Api.getUserByToken(token).then((user){
        if(user == null){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) => const LoginScreen()
          ), (route) => false);
          return;
        }
        setState((){
          loadingInitialUserData = false;
        });
        _refreshData();
      });
    });
  }

  Future<void> _refreshData() async{
    final userData = await Api.getUserData();
    if(userData != null){
      userDataNotifier.value = userData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return loadingInitialUserData ?
      const Center(
        child: CircularProgressIndicator(
          color: AppColors.darkPurpleColor,
        ),
      ) : Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            HomeAppBar(
              valueNotifier: visibleNotifier,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: visibleNotifier.listenable,
              builder: (context, value, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAccountCashAndOptions(
                    userDataNotifier: userDataNotifier,
                    cashVisible: value,
                  ),
                  const SizedBox(height: 20,),
                  const Divider(
                    color: AppColors.grayColor,
                    thickness: 3,
                  ),
                  const SizedBox(height: 20,),
                  HomeCreditCardInfo(
                    userDataNotifier: userDataNotifier,
                    cashVisible: value
                  ),
                  const SizedBox(height: 2,),
                  const Divider(
                    color: AppColors.grayColor,
                    thickness: 3,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text("Acompanhe também",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Padding(
                    padding: EdgeInsets.all(20),
                      child: LargeSimpleButton(
                      icon: Icons.payments_outlined,
                      text: "Assistente de pagamento",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}