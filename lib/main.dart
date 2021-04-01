import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Custom Paint",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Offset pos = Offset(0,0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details){
            setState(() {
            RenderBox box = context.findRenderObject();
            pos = box.globalToLocal(details.globalPosition);
            });
        },
              child: Container(
          child: CustomPaint(
            painter: Draw(pos),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class Draw extends CustomPainter {

  final Offset pos;
  Draw(this.pos);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.red;

    // var c = Offset(size.width / 2, size.height / 2);
    // canvas.drawCircle(c, 60, paint);

    // var d = Offset(size.width / 4, size.height / 4);
    // paint.color = Colors.blue;
    // var rect = Rect.fromCenter(center: d, width: 100, height: 50);
    // canvas.drawRect(rect, paint);

    // var p1 = Offset(0, 500);
    // var p2 = Offset(size.width / 2, 100);
    // paint.strokeWidth = 10;
    // paint.color = Colors.green;
    // canvas.drawLine(p1, p2, paint);

    canvas.drawCircle(pos, 50, paint);

  }

  @override
  bool shouldRepaint(Draw old) {
    return old.pos != pos;
  }
}
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Draggable Custom Painter',
//       home: Scaffold(
//         body: CustomPainterDraggable(),
//       ),
//     );
//   }
// }

// class CustomPainterDraggable extends StatefulWidget {
//   @override
//   _CustomPainterDraggableState createState() => _CustomPainterDraggableState();
// }

// class _CustomPainterDraggableState extends State<CustomPainterDraggable> {
//   var xPos = 0.0;
//   var yPos = 0.0;
//   final width = 100.0;
//   final height = 100.0;
//   bool _dragging = false;

//   /// Is the point (x, y) inside the rect?
//   bool _insideRect(double x, double y) =>
//       x >= xPos && x <= xPos + width && y >= yPos && y <= yPos + height;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanStart: (details) => _dragging = _insideRect(
//         details.globalPosition.dx,
//         details.globalPosition.dy,
//       ),
//       onPanEnd: (details) {
//         _dragging = false;
//       },
//       onPanUpdate: (details) {
//         if (_dragging) {
//           setState(() {
//             xPos += details.delta.dx;
//             yPos += details.delta.dy;
//           });
//         }
//       },
//       child: Container(
//         color: Colors.white,
//         child: CustomPaint(
//           painter: RectanglePainter(Rect.fromLTWH(xPos, yPos, width, height)),
//           child: Container(),
//         ),
//       ),
//     );
//   }
// }

// class RectanglePainter extends CustomPainter {
//   RectanglePainter(this.rect);
//   final Rect rect;

//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawRect(rect, Paint());
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
