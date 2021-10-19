import 'package:flutter/material.dart';

class ImageFullScreenWrapperWidget extends StatelessWidget {
  final Image child;
  final bool dark;

  ImageFullScreenWrapperWidget({
    this.child,
    this.dark = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            barrierColor: dark ? Colors.black : Colors.white,
            pageBuilder: (BuildContext context, _, __) {
              return FullScreenPage(
                child: child,
                dark: dark,
              );
            },
          ),
        );
      },
      child: child,
    );
  }
}

class FullScreenPage extends StatefulWidget {

  final String productId;
  FullScreenPage({
    this.child,
    this.dark,
    this.productId
  });

  final Image child;
  final bool dark;

  @override
  _FullScreenPageState createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Photos'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: widget.dark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 333),
                curve: Curves.fastOutSlowIn,
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.5,
                  maxScale: 4,
                  child: Center(child: widget.child),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
