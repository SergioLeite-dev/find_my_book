import 'package:find_my_book/models/response/volume_info_model.dart';
import 'package:find_my_book/widgets/make_favorite_button.dart';
import 'package:flutter/material.dart';

class VolumeCard extends StatelessWidget {
  const VolumeCard(
    this.volumeInfo, {
    super.key,
  });

  final VolumeInfo? volumeInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Ink(
            height: 196,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 128,
                        height: 184,
                        child: volumeInfo?.imageLinks?.thumbnail != null ? Image.network(volumeInfo!.imageLinks!.thumbnail) : const Placeholder(),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: volumeInfo?.title),
                                  TextSpan(text: volumeInfo?.subtitle != null ? ": ${volumeInfo?.subtitle}" : null),
                                ],
                              ),
                            ),
                            if (volumeInfo?.authors != null) ...[
                              const SizedBox(height: 6),
                              Text(volumeInfo!.authors!.join(", ")),
                            ],
                            if (volumeInfo?.description != null) ...[
                              const SizedBox(height: 6),
                              Expanded(
                                child: Text(
                                  volumeInfo!.description!,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: MakeFavoriteButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
