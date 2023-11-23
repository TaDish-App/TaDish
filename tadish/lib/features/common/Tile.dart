import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
    required this.image,
    required this.dishName,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;
  final String image;
  final String dishName;

  @override
  Widget build(BuildContext context) {
    final child = Stack(children: [
      Container(
        // color: backgroundColor ?? Colors.grey.shade200,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        height: extent,
      ),
      // TODO Remove instead of making colors transparent as they may be clickable in future
      Column(
        children: [
          const Spacer(flex: 2),
          Container(
            padding: const EdgeInsets.all(3),
            color: dishName != ''
                ? Colors.black.withOpacity(.40)
                : Colors.transparent,
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      dishName),
                ),
              ],
            ),
          ),
        ],
      )
    ]);

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
