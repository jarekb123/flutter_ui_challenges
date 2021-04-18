import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

const _colors = [
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.black,
];

class HorizontalListViewInScrollable extends StatefulWidget {
  const HorizontalListViewInScrollable({Key? key}) : super(key: key);

  @override
  _HorizontalListViewInScrollableState createState() =>
      _HorizontalListViewInScrollableState();
}

class _HorizontalListViewInScrollableState
    extends State<HorizontalListViewInScrollable> {
  double? _listViewHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal ListView in Scrollable Column'),
      ),
      body: WidgetWithCodeView(
        sourceFilePath:
            'lib/ui/scrollable/horizontal_listview_in_scrollable_column.dart',
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'It is possible to have horizontal ListView in scrollable Column. But it is needed to calculate size of widget with the largest height.',
              ),
              SizedBox(height: 16),
              if (_listViewHeight == null)
                OffstageWidgetSizeProvider(
                  onSizeCalculated: (size) =>
                      setState(() => _listViewHeight = size.height),
                  child: _Item(),
                ),
              if (_listViewHeight != null)
                SizedBox(
                  height: _listViewHeight,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _Item(),
                    separatorBuilder: (_, __) => SizedBox(width: 8),
                    itemCount: 100,
                  ),
                ),
              SizedBox(height: 16),
              ..._colors.map(
                (color) => Container(
                  height: 50,
                  width: double.infinity,
                  color: color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OffstageWidgetSizeProvider extends StatelessWidget {
  const OffstageWidgetSizeProvider({
    Key? key,
    required this.onSizeCalculated,
    required this.child,
  }) : super(key: key);

  final ValueChanged<Size> onSizeCalculated;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      child: Builder(
        builder: (context) {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            if (context.size != null) onSizeCalculated(context.size!);
          });

          return child;
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _colors[Random().nextInt(_colors.length)],
      height: 300,
      width: 200,
    );
  }
}
