import 'package:find_my_book/models/response/volume_info_model.dart';
import 'package:flutter/material.dart';

class VolumeCard extends StatelessWidget {
  const VolumeCard(
    this.volumeInfo, {
    super.key,
  });

  final VolumeInfo? volumeInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(children: [
          SizedBox(
            width: 128,
            height: 184,
            child: volumeInfo?.imageLinks?.thumbnail != null ? Image.network(volumeInfo!.imageLinks!.thumbnail) : const Placeholder(),
          ),
          Column(
            children: [],
          ),
        ]),
      ),
    );
  }
}
