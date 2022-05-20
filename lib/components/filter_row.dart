import 'package:flowershop/components/hamburger_menu.dart';
import 'package:flowershop/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/product.dart';

// typedef Filter = bool Function(Product p);

class Filter {
  final String name;
  bool isActive;

  Filter({required this.name, this.isActive = false});
}

class Filters extends StateNotifier<List<Filter>> {
  Filters()
      : super([
          Filter(name: "Tulips"),
          Filter(name: "Popular"),
          Filter(name: "Bouquets"),
          Filter(name: "Roses"),
          Filter(name: "f000000000000000"),
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

class FilterRow extends ConsumerWidget {
  const FilterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Filter> filters = ref.watch(filtersProvider);
    return Row(children: [
      // const SizedBox(width: 19),
      // const HamburgerMenu(),
      // const SizedBox(width: 23),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (final filter in filters)
              GestureDetector(
                onTap: () => ref.read(filtersProvider.notifier).toggle(filter),
                child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                        color: filter.isActive
                            ? activeFilterColor
                            : inactiveFilterColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Text(filter.name,
                        style: TextStyle(
                            color: filter.isActive
                                ? Colors.white
                                : inactiveFilterTextColor,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400))),
              )
          ]))
    ]);
  }
}

final filtersProvider = StateNotifierProvider<Filters, List<Filter>>((ref) {
  return Filters();
});
