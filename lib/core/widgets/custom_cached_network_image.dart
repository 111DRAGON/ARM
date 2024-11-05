import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_state.dart';

customCachedImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    fit: BoxFit.fill,
    placeholder: (context, url) => const LoadingState(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

customCachedImageProvider(String url) {
  return CachedNetworkImageProvider(
    url,
    errorListener: (val) => const Icon(Icons.error),

  );
}
