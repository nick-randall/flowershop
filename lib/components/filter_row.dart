import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/product.dart';

typedef Filter = bool Function(Product p);

class Filters extends StateNotifier<List<Filter>> {
  Filters() : super([]);
}

class FilterRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final filtersProvider = StateNotifierProvider<Filters, List<Filter>>((ref) {
  return Filters();
});
