import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {

    static const historyLength = 3; 
    List<String> _searchHistory = [];

    late List<String> filteredSearchHis; 

    late String selectedTerm; 

    List<String> filteredSearchTerm({
      @required String? filter, 
    }) {
      if (filter != null && filter.isNotEmpty) {
        return _searchHistory.reversed.where((term) => term.startsWith(filter)).toList();
      } 
      else {
        return _searchHistory.reversed.toList(); 
      }
    }

    void searchTerm(String term) {
      if (_searchHistory.contains(term)) {
        addSearchTerm(term); 
        return; 
      }
      _searchHistory.add(term);
      if (_searchHistory.length > historyLength) {
        _searchHistory.removeRange(0, _searchHistory.length - historyLength); 
      }
      
      filteredSearchHis = filteredSearchTerm(filter: null);

    }

  

  @override
  Widget build(BuildContext context) {
    return 
  }
}