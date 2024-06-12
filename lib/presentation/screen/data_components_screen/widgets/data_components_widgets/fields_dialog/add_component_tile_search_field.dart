import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:searchfield/searchfield.dart';

class AddComponentSearchField extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode searchFieldFocusNode;
  final Property property;
  final List<String> components;
  final ValueChanged<String> onSelect;
  final VoidCallback onClear;

  const AddComponentSearchField({
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
    return SearchField<String>(
      controller: searchController,
      focusNode: searchFieldFocusNode,
      suggestions: components
          .map((e) => SearchFieldListItem<String>(e, item: e))
          .toList(),
      maxSuggestionsInViewPort: 8,
      marginColor: context.appColors.darkColor,
      itemHeight: 45,
      offset: const Offset(0, 58),
      initialValue: property.type.isEmpty
          ? null
          : SearchFieldListItem<String>(property.type,
              item:
                  components.firstWhere((element) => element == property.type)),
      onSuggestionTap: (value) => onSelect(value.item!),
      searchStyle: context.appTextStyles.fs18?.copyWith(
        color: context.appColors.textColor,
      ),
      searchInputDecoration: InputDecoration(
        filled: true,
        fillColor: context.appColors.darkContrastColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: searchController.text.isNotEmpty
                ? context.appColors.contrastColor
                : context.appColors.alarmColor,
            width: searchController.text.isNotEmpty ? 1 : 5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: searchController.text.isNotEmpty
                ? context.appColors.contrastColor
                : context.appColors.alarmColor,
            width: searchController.text.isNotEmpty ? 1 : 5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          splashRadius: 27,
          icon: Icon(
            Icons.clear,
            color: context.appColors.controlColor,
          ),
          onPressed: () => onClear(),
        ),
      ),
      suggestionStyle: context.appTextStyles.fs18?.copyWith(
        color: context.appColors.textColor,
      ),
      suggestionsDecoration: SuggestionDecoration(
        color: context.appColors.fadedColor,
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
