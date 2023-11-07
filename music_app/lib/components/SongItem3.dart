import 'package:flutter/widgets.dart';

class SongItem3 extends StatelessWidget {
  const SongItem3({super.key, required this.thumbnail});

  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        thumbnail,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
