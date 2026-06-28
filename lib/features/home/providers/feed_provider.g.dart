// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredFeedHash() => r'27b8514c8498874053f8a7bae6a1b40e615e1735';

/// See also [filteredFeed].
@ProviderFor(filteredFeed)
final filteredFeedProvider = AutoDisposeProvider<List<FeedItem>>.internal(
  filteredFeed,
  name: r'filteredFeedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filteredFeedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredFeedRef = AutoDisposeProviderRef<List<FeedItem>>;
String _$feedLanguageFilterHash() =>
    r'5525b8be0f11043145bf11510e91a7e2efbcf4f6';

/// See also [FeedLanguageFilter].
@ProviderFor(FeedLanguageFilter)
final feedLanguageFilterProvider =
    AutoDisposeNotifierProvider<FeedLanguageFilter, String>.internal(
  FeedLanguageFilter.new,
  name: r'feedLanguageFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedLanguageFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FeedLanguageFilter = AutoDisposeNotifier<String>;
String _$feedNotifierHash() => r'9ebbff160cbdae480ecdc4854cad744372e79eba';

/// See also [FeedNotifier].
@ProviderFor(FeedNotifier)
final feedNotifierProvider =
    AutoDisposeNotifierProvider<FeedNotifier, List<FeedItem>>.internal(
  FeedNotifier.new,
  name: r'feedNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$feedNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FeedNotifier = AutoDisposeNotifier<List<FeedItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
