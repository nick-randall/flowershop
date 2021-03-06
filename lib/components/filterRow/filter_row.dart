import 'package:flowershop/components/filterRow/hamburger_menu.dart';
import 'package:flowershop/constants/colors.dart';
import 'package:flowershop/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../stateProviders/filtersProvider.dart';

class FilterRow extends ConsumerWidget {
  const FilterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Filter> filters = ref.watch(filtersProvider);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, top: 46),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Categories', style: categoriesTitleStyle)),
        ),
        const SizedBox(height: 12),
        Row(children: [
          const SizedBox(width: 19),
          const HamburgerMenu(),
          // 23 as appears in Figma design minus the 4 margin of the buttons
          const SizedBox(width: 19),
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (final filter in filters)
                    GestureDetector(
                      onTap: () =>
                          ref.read(filtersProvider.notifier).toggle(filter),
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
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
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400))),
                    )
                ])),
          )
        ]),
        const SizedBox(height: 16),
      ],
    );
  }
}
