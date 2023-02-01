import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewScreen extends StatefulWidget {
  const StaggeredGridViewScreen({Key? key}) : super(key: key);

  @override
  State<StaggeredGridViewScreen> createState() =>
      _StaggeredGridViewScreenState();
}

class _StaggeredGridViewScreenState extends State<StaggeredGridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
             StaggeredGridTile.count(crossAxisCellCount: 2,
                 mainAxisCellCount: 2,
                 child: Image.asset('images/about_introduce.jpg',fit: BoxFit.cover)
             ),
              StaggeredGridTile.count(crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Image.asset('images/about_introduce.jpg', fit: BoxFit.cover,)
              ),
              StaggeredGridTile.count(crossAxisCellCount: 4,
                  mainAxisCellCount: 2,
                  child: Image.asset('images/about_introduce.jpg', fit: BoxFit.cover,)
              ),
              StaggeredGridTile.count(crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Image.asset('images/about_introduce.jpg', fit: BoxFit.cover,)
              ),
              StaggeredGridTile.count(crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Image.asset('images/about_introduce.jpg',fit: BoxFit.cover,)
              ),
              StaggeredGridTile.count(crossAxisCellCount: 4,
                  mainAxisCellCount: 2,
                  child: Image.asset('images/about_introduce.jpg', fit: BoxFit.cover,)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
