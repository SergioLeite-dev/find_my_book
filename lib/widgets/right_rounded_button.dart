import 'package:find_my_book/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightRoundedButton extends StatelessWidget {
  const RightRoundedButton({
    super.key,
    required this.iconData,
    required this.height,
    required this.radius,
  });

  final IconData iconData;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchController>(context, listen: false);
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: controller.search,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          )),
        ),
        child: Icon(
          iconData,
          size: 32,
        ),
      ),
    );
  }
}
