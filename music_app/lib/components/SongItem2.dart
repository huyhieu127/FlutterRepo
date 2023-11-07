import 'package:flutter/widgets.dart';

class SongItem2 extends StatelessWidget {
  const SongItem2({super.key, required this.thumbnail});

  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        thumbnail,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
