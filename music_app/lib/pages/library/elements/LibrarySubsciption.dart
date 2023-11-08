import 'package:flutter/widgets.dart';
import 'package:music_app/components/SongItem3.dart';

class LibrarySubscription extends StatefulWidget {
  const LibrarySubscription({super.key, required this.subscriptions});
  final List<String> subscriptions;
  @override
  State<LibrarySubscription> createState() => _LibrarySubscriptionState();
}

class _LibrarySubscriptionState extends State<LibrarySubscription> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.subscriptions.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 24, right: 0, bottom: 24, top: 16),
      itemBuilder: (context, index) {
        return SongItem3(
          thumbnail: widget.subscriptions[index],
          author: "Band Band Band Band Band Band",
          count: 456,
          onTapMore: () {},
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
    );
  }
}
