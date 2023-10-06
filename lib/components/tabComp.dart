import 'package:flutter/cupertino.dart';

import '../screens/NewsScreen/controller/controller.dart';
import 'customCont.dart';

class customListView extends StatelessWidget {
  const customListView({
    super.key,
    required this.controller,
  });

  final NewsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.article.length,
      itemBuilder: (context, index) {
        return customCont(
          title: controller.article[index].title,
          index: index,
        );
      },
    );
  }
}
