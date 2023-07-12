// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = 'filters';
  final saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.saveFilters, this.currentFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget buildSwitch(bool val, String text, updateVal) {
    return SwitchListTile(
      value: val,
      title: Text(text),
      subtitle: Text('Only Include ${text} Meals'),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final _selectedFilters = {
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                };
                widget.saveFilters(_selectedFilters);
                Navigator.of(context).pushReplacementNamed('/');

              },
              icon: Icon(
                Icons.save,
              ))
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitch(
                _glutenFree,
                'Gluten-free',
                (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                },
              ),
              buildSwitch(
                _vegan,
                'Vegan',
                (val) {
                  setState(() {
                    _vegan = val;
                  });
                },
              ),
              buildSwitch(
                _vegetarian,
                'vegetarian',
                (val) {
                  setState(() {
                    _vegetarian = val;
                  });
                },
              ),
              buildSwitch(
                _lactoseFree,
                'Lactose-free',
                (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
