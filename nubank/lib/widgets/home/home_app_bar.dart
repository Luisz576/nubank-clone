import 'package:flutter/material.dart';
import 'package:nubank/notifiers/simple_notifier.dart';
import 'package:nubank/screens/configs_screen.dart';
import 'package:nubank/services/api.dart';
import 'package:nubank/utils/app_colors.dart';

class HomeAppBar extends StatefulWidget {
  final SimpleNotifier<bool> valueNotifier;
  const HomeAppBar({required this.valueNotifier, Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {

  _toggleVisible(){
    widget.valueNotifier.value = !widget.valueNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    if(Api.user == null){
      return Container();
    }
    return Container(
      color: AppColors.lightPurpleColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const ConfigsScreen()
                        ));
                      },
                      hoverColor: null,
                      child: const CircleAvatar(
                        backgroundColor: AppColors.lightlightPurpleColor,
                        radius: 30,
                        child: Center(
                          child: Icon(Icons.person_outline,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text("Olá, ${Api.user!.name}",
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: widget.valueNotifier.listenable,
                    builder: (context, value, child) => IconButton(
                      onPressed: _toggleVisible,
                      icon: Icon(value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.question_mark_outlined,
                      color: AppColors.whiteColor
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.person_add_outlined,
                      color: AppColors.whiteColor
                    ),
                  ),
                  const SizedBox(width: 10,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}