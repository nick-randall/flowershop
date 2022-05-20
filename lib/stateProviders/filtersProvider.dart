import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filter {
  final String name;
  bool isActive;

  Filter({required this.name, this.isActive = false});
}

final filtersProvider = StateNotifierProvider<Filters, List<Filter>>((ref) {
  return Filters();
});

class Filters extends StateNotifier<List<Filter>> {
  Filters()
      : super([
          Filter(name: "Tulips"),
          Filter(name: "Popular"),
          Filter(name: "Bouquets"),
          Filter(name: "Roses"),
          Filter(name: "Hibiscus")
        ]);

  void toggle(Filter filterToToggle) {
    state = [
      for (final filter in state)
        if (filterToToggle.name == filter.name)
          Filter(name: filterToToggle.name, isActive: !filterToToggle.isActive)
        else
          filter
    ];
  }
}
