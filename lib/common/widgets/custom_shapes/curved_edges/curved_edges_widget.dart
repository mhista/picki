import 'package:flutter/material.dart';

import 'curved_edge.dart';

class PCurvedEdgesWidget extends StatelessWidget {
  const PCurvedEdgesWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: PCustomCurvedEdges(), child: child);
  }
}
