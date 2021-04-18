import 'package:flutter/material.dart';

/// WHY THIS WORKS?
/// https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html#expanding-content-to-fit-the-viewport

class FooterInScrollableExample extends StatelessWidget {
  const FooterInScrollableExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Footer in Scrollable Column'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(child: _Body()),
                    SizedBox(height: 16),
                    Text(
                      'Footer is pinned to bottom of viewport if not scrollable',
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Button pinned to bottom'),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...[
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.orange,
          Colors.purple,
          Colors.yellow,
          Colors.purple,
        ].map(
          (color) => Container(
            height: 100,
            width: double.infinity,
            color: color,
          ),
        ),
      ],
    );
  }
}
