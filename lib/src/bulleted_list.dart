import 'package:flutter/material.dart';
import 'package:bulleted_list/src/styles.dart';

enum ListOrder {
  unordered,
  ordered,
}

///
///  Equivalent to HTML Lists, unordered by default.
///  the items can be array of String or array Widgets
///  array of Strings can be ordered.
///
class BulletedList extends StatelessWidget {
  final List<dynamic> listItems;
  final TextStyle? style;
  final Widget? bullet;
  final ListOrder listOrder;
  final Color bulletColor;
  const BulletedList({
    Key? key,
    required this.listItems,
    this.style,
    this.bullet,
    this.listOrder = ListOrder.unordered,
    this.bulletColor = Colors.blueGrey,
  }) : super(key: key);

  Widget _bullet(BuildContext context) {
    return bullet ??
        Container(
          height: 10,
          width: 10,
          decoration: new BoxDecoration(
            color: bulletColor,
            shape: BoxShape.circle,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (listOrder == ListOrder.ordered && listItems is List<String>) {
      listItems.sort((a, b) => a.compareTo(b));
    }

    return Column(
      children: listItems
          .map((item) => ListTile(
              dense: true,
              minLeadingWidth: 10,
              leading: _bullet(context),
              title: item == null
                  ? Text(
                      '',
                      style: TextStyles.body2.merge(style),
                    )
                  : item is String
                      ? Text(item, style: TextStyles.body2.merge(style))
                      : item is Widget
                          ? item
                          : Text(
                              'Error: Only Widget/String allowed:\n' +
                                  item.toString(),
                            )))
          .toList(),
    );
  }
}
