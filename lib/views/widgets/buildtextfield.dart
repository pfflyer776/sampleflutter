import 'package:flutter/material.dart';

Widget buildTextField(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 8),
      Text(label,
        style: TextStyle(
          color: Color(0xFF736B7C),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          color: Color(0xFF2A1E39),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

Widget buildEditField(String label, String value, Function(String) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600)
      ),
      TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
      ),
    ],
  );
}

Widget buildDropDownField(String label, String value, List<String> items, Function(String?) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      DropdownButtonFormField<String>(
        value: value,
        icon: Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    ],
  );
}