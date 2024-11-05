import 'package:flutter/widgets.dart';

import '../../data/models/region_data_model.dart';
import 'choose_region_list_view_item.dart';

class ChooseRegionListView extends StatelessWidget {
  const ChooseRegionListView(this.items,{super.key});

  final List<RegionDataModel> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      reverse: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ChooseRegionListViewItem(items[index]);
      },
    );
  }
}
