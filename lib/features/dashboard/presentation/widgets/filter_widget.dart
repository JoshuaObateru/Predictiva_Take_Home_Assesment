import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final Function(String text, String selectedValue, DateTime startDate, DateTime endDate) onApply;

  const FilterWidget({required this.onApply});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String _searchText = "";
  String _selectedValue = "All"; // Replace with your initial selection options
  DateTime? _startDate;
  DateTime? _endDate;

  final _formKey = GlobalKey<FormState>();

  void _showDatePicker(BuildContext context, bool isStartDate) async {
    final initialDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? (_startDate ?? initialDate) : (_endDate ?? initialDate),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
          _endDate = null; // Reset end date on start date change
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Search Text",
              border: OutlineInputBorder(),
            ),
            validator: (value) => value!.isEmpty ? "Please enter a search text" : null,
            onSaved: (value) => setState(() => _searchText = value!),
          ),
          DropdownButtonFormField<String>(
            value: _selectedValue,
            decoration: InputDecoration(
              labelText: "Select Filter",
              border: OutlineInputBorder(),
            ),
            items: [
              DropdownMenuItem(
                value: "All",
                child: Text('All'),
              ),
              // Add more DropdownMenuItem for your selection options
            ],
            onChanged: (value) => setState(() => _selectedValue = value!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () => _showDatePicker(context, true),
                icon: Icon(Icons.calendar_today),
                label: Text(_startDate?.toString() ?? "Start Date"),
              ),
              TextButton.icon(
                onPressed: () => _showDatePicker(context, false),
                icon: Icon(Icons.calendar_today),
                label: Text(_endDate?.toString() ?? "End Date"),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onApply(_searchText, _selectedValue, _startDate!, _endDate!);
              }
            },
            child: Text('Apply Filter'),
          ),
        ],
      ),
    );
  }
}
