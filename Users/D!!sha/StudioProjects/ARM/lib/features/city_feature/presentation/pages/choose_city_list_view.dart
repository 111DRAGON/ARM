import 'package:flutter/material.dart';

import '../../data/models/city_data_model.dart';
import 'choose_city_list_view_item.dart';

class ChooseRegionCitySectionListView extends StatelessWidget {
  const ChooseRegionCitySectionListView(this.data,{super.key});

  final List<CityDataModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      reverse: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ChooseRegionCityListViewItem(data[index]);
      },
    );
  }
}
