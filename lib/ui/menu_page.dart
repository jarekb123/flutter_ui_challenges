import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/ui/scrollable/footer_in_scrollable_example.dart';
import 'package:flutter_ui_challenges/ui/scrollable/horizontal_listview_in_scrollable_column.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UI Challenges'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FooterInScrollableExample(),
                ),
              ),
              child: Text('Footer in Scrollable Column'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HorizontalListViewInScrollable(),
                ),
              ),
              child: Text('Horizontal ListView in Scrollable Column'),
            ),
          ],
        ),
      ),
    );
  }
}
