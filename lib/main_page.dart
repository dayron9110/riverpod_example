import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_example/main_page_view_model.dart';

final mainPageProvider = ChangeNotifierProvider((ref) => MainPageViewModel());

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RiverPodExample'),
        ),
        body: Consumer(builder: (context, watch, child) {
          final mainPageViewModel = watch(mainPageProvider);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),
              Text(mainPageViewModel.observableText ?? ''),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (text) => mainPageViewModel.onTextChanged(text),
                ),
              ),
              SizedBox(height: 40),
              Container(height: 50, width: 50, color: mainPageViewModel.color),
              SizedBox(height: 40)
            ],
          );
        }));
  }
}
