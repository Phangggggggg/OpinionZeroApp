import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/news.dart';
import '/providers/listnews_provider.dart';
import 'package:provider/provider.dart';
import '/colors/colors.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
//   final _textcontrollerTEXT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0,0.0,8.0,3.0),
      child: Column(
        children: [
          TextField(
           
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.all(9),
              contentPadding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10.0),
              filled: true,
              fillColor: Color.fromARGB(255, 221, 221, 221),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
                // borderSide: BorderSide(color: Color.fromARGB(255, 182, 182, 182), width: 0.0),
               
              ),
              hintText: "Search",
              prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 92, 91, 91)),
              hintStyle: TextStyle(fontSize: 16),
              suffixIcon: Icon(Icons.filter_list, color: Color.fromARGB(255, 92, 91, 91)),
            ),
            // controller: _textcontrollerTEXT,
            onChanged: (value) {
              context.read<ListNewsProvider>().filterList(value);
              // Provider.of<ListNewsProvider>(context, listen: false)
              //     .filterList(value);
            },
          ),
        
          //   Expanded(
          //     child:
          //     ListView.builder(
          //       itemCount: display_list.length,
          //       itemBuilder: (context, index) =>
          //     ),
          //   )
        ],
      ),
    );
  }
}
