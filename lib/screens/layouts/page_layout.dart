import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techapp/providers/event_provider.dart';
import 'package:techapp/screens/components/style.dart';
import '../../controllers/MenuController.dart';
import '../../screens/layouts/header.dart';
import 'side_menu.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final fetchData = Provider.of<FetchDataProvider>(context);
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: Stack(
        children: [
          getGradient(),
          SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // It takes 5/6 part of the screen
                  flex: 5,
                  child: SingleChildScrollView(
                    child: fetchData.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            children: [
                              Header(),
                              child,
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
