import 'package:flutter/material.dart';
import 'package:bulleted_list/src/styles.dart';

enum ListOrder {
  unordered,
  ordered,
}

/// Flutter widget that defines both *unordered lists* of Widgets and *ordered 
/// lists* of Strings of text with a default round bullet preceding each item.
/// 

class BulletedList extends StatelessWidget {
  /// Required. [listItems] may be a list of Strings or a list of Widgets
  final List<dynamic> listItems;
  /// Optional. Additional styling for a String item. Ignored for Widget items.
  final TextStyle? style;
  /// Optional. If this widget is not specified, a default dark circle is used.
  final Widget? bullet;
  /// Optional. Applicable only for String items. Ignored for Widget items.
  final ListOrder listOrder;
  /// Optional. Color for the default bullet. Ignored if [bullet] above is specified.
  final Color bulletColor;
  /// Optional. Cross axis alignment of the items list. Center is default.
  final CrossAxisAlignment crossAxisAlignment;
  const BulletedList({
    Key? key,
    required this.listItems,
    this.style,
    this.bullet,
    this.listOrder = ListOrder.unordered,
    this.bulletColor = Colors.blueGrey,
    this.crossAxisAlignment = CrossAxisAlignment.center,
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

    return Container(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: listItems
            .map(
              (item) => ListTile(
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
                                )),
            )
            .toList(),
      ),
    );
  }
}
