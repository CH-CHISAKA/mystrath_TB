import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String searchText = "";

  @override
  void initState() {
    super.initState();
  }

  Future<void> search() async {
    setState(() {
      // TODO: Implement search functionality
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
        TextField(
          key: const Key('searchField'),
          decoration: const InputDecoration(
            labelText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
          //Update _searchText on user input change
          onChanged: (text) {
            setState(() {
              searchText = text;
            });
          },
        ),
        const Text('Welcome Search or Should I say Sirch'),
      ])),
    );
  }
}

