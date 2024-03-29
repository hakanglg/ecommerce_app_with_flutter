import '../../../feature/single_category/view/single_category_view.dart';
import '../../../core/manager/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../feature/home/model/category_model.dart';

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Data model;

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => navigateToWidget(
            context, SingleCategoryView(slug: widget.model.slug.toString())),
        title: Text(widget.model.name.toTitleCase().toString(),
            style: context.textTheme.bodyText2));
  }
}
