import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:searchfield/searchfield.dart';

class AddComponentComponentSearchField extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode searchFieldFocusNode;
  final Property property;
  final List<DataComponent> components;
  final ValueChanged<DataComponent> onSelect;
  final VoidCallback onClear;

  const AddComponentComponentSearchField({
    required this.searchController,
    required this.searchFieldFocusNode,
    required this.property,
    required this.components,
    required this.onSelect,
    required this.onClear,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchField<DataComponent>(
      controller: searchController,
      focusNode: searchFieldFocusNode,
      suggestions: components
          .map((e) => SearchFieldListItem<DataComponent>(e.name, item: e))
          .toList(),
      maxSuggestionsInViewPort: 8,
      marginColor: AppColors.bgDark,
      itemHeight: 45,
      offset: const Offset(0, 58),
      scrollbarAlwaysVisible: false,
      initialValue: property.type.isEmpty
          ? null
          : SearchFieldListItem<DataComponent>(property.type,
              item: components
                  .firstWhere((element) => element.name == property.type)),
      onSuggestionTap: (value) => onSelect(value.item!),
      searchStyle: context.appTextStyles.fs18?.copyWith(
        color: AppColors.orange,
      ),
      searchInputDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          splashRadius: 27,
          icon: const Icon(
            Icons.clear,
            color: AppColors.orange,
          ),
          onPressed: () => onClear(),
        ),
      ),
      suggestionStyle: context.appTextStyles.fs18?.copyWith(
        color: AppColors.bgDark,
      ),
      suggestionsDecoration: SuggestionDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
