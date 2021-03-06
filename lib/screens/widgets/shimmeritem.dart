import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:techapp/screens/components/style.dart';
// ignore: import_of_legacy_library_into_null_safe

class ShimmerBuilder extends StatelessWidget {
  final double imageheight;
  final bool title;
  final bool subtitle;

  const ShimmerBuilder(
      {Key? key,
      required this.imageheight,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return shimmerItem(imageheight, title, subtitle);
        },
      ),
    );
  }
}

class ShimmerBuilder2 extends StatelessWidget {
  final double imageheight;
  final bool title;
  final bool subtitle;

  const ShimmerBuilder2(
      {Key? key,
      required this.imageheight,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return shimmerItem(imageheight, title, subtitle);
      },
    );
  }
}

Widget shimmerItem(double imageheight, bool title, bool subtitle) {
  return Container(
    child: Card(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: Container(
          decoration: boxDecoration.copyWith(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Row(
                children: <Widget>[
                  Shimmer.fromColors(
                    baseColor: Colors.white24,
                    highlightColor: Colors.white,
                    child: Container(
                      width: imageheight,
                      height: imageheight,
                      decoration: boxDecoration.copyWith(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (title)
                            Shimmer.fromColors(
                              baseColor: white,
                              highlightColor: Colors.white24,
                              child: Container(
                                width: double.infinity,
                                height: 20,
                                decoration: boxDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          if (subtitle)
                            Shimmer.fromColors(
                              baseColor: Colors.white24,
                              highlightColor: Colors.white,
                              child: Container(
                                width: double.infinity,
                                height: 40,
                                decoration: boxDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
  );
}
