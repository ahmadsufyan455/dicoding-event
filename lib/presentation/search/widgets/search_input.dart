import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSearch;
  final Function(String)? onChanged;
  const SearchInput({
    super.key,
    required this.controller,
    this.onSearch,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSearch,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        isDense: true,
        hintText: 'Search event...',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
