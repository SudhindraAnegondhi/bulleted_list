Flutter widget that defines *numbered lists* *unordered lists* of Widgets and *ordered lists* of Strings of text with a default round bullet preceding each item. This widget was developed specfically for Flutter Web but runs on all platforms.


## Examples

### Flutter Web

<img src="https://github.com/SudhindraAnegondhi/bulleted_list/blob/main/assets/images/webpage.png">

```dart
...

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(sm: 12, md: 4, child: Container()),
          ResponsiveGridCol(
            sm: 12,
            md: 4,
            child: Column(
              children: [
                Text(
                  'Seamless Viewing',
                  style: TextStyles.h1,
                  textAlign: TextAlign.center,
                ),
                _para(
                    'The photos and videos on your local cloud or any other cloudservice* can be viewed just as if they were on your phone.'),
                BulletedList(
                  bullet: Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  listItems: [
                    'The photos on your local cloud are viewable when you are on the local network.',
                    'You can view your media pretty much everywhere - just upgrade to AcmePhoto\'s Cloud service',
                    'You can also choose to use your own Amazon AWS or Google Cloud accounts'
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )
...
```

### Android Phone

<img src="https://github.com/SudhindraAnegondhi/bulleted_list/blob/main/assets/images/bulleted_list.png">


```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> names =
        List.generate(5, (index) => '${mockName()}: ${mockLocation()}');
    final List<Widget> widgets = List.generate(
      5,
      (index) => Container(
        width: 200,
        height: 100,
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Url: ${mockUrl()}'),
              Text('ID: ${mockUUID()}'),
              Text('Date:${mockDate()}'),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Bulleted List Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1400,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BulletedList(
                listItems: names,
                listOrder: ListOrder.ordered,
              ),
              BulletedList(
                listItems:names,
                listOrder: ListOrder.ordered,
                bulletType: BulletType.numbered,
              ),
              BulletedList(
                listItems: widgets,
                bullet: Icon(Icons.star),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

##  Features

* Generate numbered, ordered and unordered lists

* The Lists can be String or arbitrary Widgets

* Customize styling of all components of the generated lists

## Usage

Import the package

```dart

import 'package:bulleted_list/bulleted_list.dart';

```

Use the `BulletedList` widget, specifying the list and options.

```dart

return Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    BulletedList(
      listItems: names,
      listOrder: ListOrder.ordered,
    ),
    BulletedList(
      listItems:names,
      listOrder: ListOrder.ordered,
      bulletType: BulletType.numbered,
    ),
    BulletedList(
      listItems: widgets,
      bullet: Icon(Icons.star),
    ),
  ],
);
```

## To be added

* Hyperlink text within a String
* Add Gesture detectors to the Bullets to select them



