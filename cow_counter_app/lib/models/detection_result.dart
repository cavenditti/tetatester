class DetectionResult {
  final int cowCount;
  final double confidence;
  final double processingTime;
  final List<BoundingBox> boundingBoxes;

  DetectionResult({
    required this.cowCount,
    required this.confidence,
    required this.processingTime,
    required this.boundingBoxes,
  });

  factory DetectionResult.fromJson(Map<String, dynamic> json) {
    return DetectionResult(
      cowCount: json['cowCount'] as int,
      confidence: (json['confidence'] as num).toDouble(),
      processingTime: (json['processingTime'] as num).toDouble(),
      boundingBoxes: (json['boundingBoxes'] as List<dynamic>)
          .map((box) => BoundingBox.fromJson(box as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cowCount': cowCount,
      'confidence': confidence,
      'processingTime': processingTime,
      'boundingBoxes': boundingBoxes.map((box) => box.toJson()).toList(),
    };
  }

  String get confidenceText => '${(confidence * 100).toStringAsFixed(1)}%';
  String get processingTimeText => '${processingTime.toStringAsFixed(1)}s';
}

class BoundingBox {
  final double x;
  final double y;
  final double width;
  final double height;
  final double confidence;

  BoundingBox({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.confidence,
  });

  factory BoundingBox.fromJson(Map<String, dynamic> json) {
    return BoundingBox(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      confidence: (json['confidence'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
      'width': width,
      'height': height,
      'confidence': confidence,
    };
  }

  String get confidenceText => '${(confidence * 100).toStringAsFixed(1)}%';
}