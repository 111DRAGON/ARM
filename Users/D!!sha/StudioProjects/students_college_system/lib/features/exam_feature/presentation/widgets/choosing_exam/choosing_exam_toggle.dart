import 'package:flutter/cupertino.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class ChoosingExamToggle extends StatelessWidget {
  const ChoosingExamToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height*.07,
      width: MediaQuery.of(context).size.width*.75,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2.5,
          color: CupertinoColors.lightBackgroundGray,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("كويز ", style: getMediumStyle()),
          Container(
              height: MediaQuery.of(context).size.height*.05,
              width: MediaQuery.of(context).size.width*.35,
              decoration: BoxDecoration(
                  color: ColorManager.cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                    "ميد تيرم",
                    style: getMediumStyle(),
                  )))
        ],
      ),
    );
  }
}
