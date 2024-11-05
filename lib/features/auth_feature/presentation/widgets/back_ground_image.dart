import 'package:flutter/material.dart';

import '../../../../../core/recourses/image_manager/image_manager.dart';


class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height*.60,
      width: double.infinity,

      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          opacity: 0.5,
          image: AssetImage(
            ImageManager.newLogo,
          ),
        ),
      ),
    );
  }
}
