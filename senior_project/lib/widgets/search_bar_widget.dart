import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/news.dart';
import '/providers/listnews_provider.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
//   final _textcontrollerTEXT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 215, 215, 216),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
            // controller: _textcontrollerTEXT,
            onChanged: (value) {
              context.read<ListNewsProvider>().filterList(value);
              // Provider.of<ListNewsProvider>(context, listen: false)
              //     .filterList(value);
            },
          ),
          SizedBox(
            height: 20.0,
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
