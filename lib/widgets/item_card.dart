import 'package:find_my_book/models/response/item_model.dart';
import 'package:find_my_book/widgets/toggle_favorite_button.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
    this.item, {
    super.key,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    final info = item.volumeInfo;

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
                        child: info.imageLinks?.thumbnail != null ? Image.network(info.imageLinks!.thumbnail) : const Placeholder(),
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
                                  TextSpan(text: info.title),
                                  TextSpan(text: info.subtitle != null ? ": ${info.subtitle}" : null),
                                ],
                              ),
                            ),
                            if (info.authors != null) ...[
                              const SizedBox(height: 6),
                              Text(info.authors!.join(", ")),
                            ],
                            if (info.description != null) ...[
                              const SizedBox(height: 6),
                              Expanded(
                                child: Text(
                                  info.description!,
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ToggleFavoriteButton(item.id),
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
