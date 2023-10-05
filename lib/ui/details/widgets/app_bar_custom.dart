import 'package:flutter/material.dart';
import 'package:todo_task/utils/app_colors.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
    required this.body,
    this.showButton,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;
  final Widget body;
  final bool? showButton;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  ScrollController _scrollController = ScrollController();
  bool lastStatus = true;

  _scrollListener() {
    if (isPined != lastStatus) {
      setState(() {
        lastStatus = isPined;
      });
    }
  }

  bool get isPined {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            scrolledUnderElevation: 0,
            expandedHeight: (204 + 56) * height / 812,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: true,
            backgroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                    left: 20 * width / 375, bottom: 10 * height / 812),
                // Adjust padding as needed
                title: Padding(
                  padding:
                      EdgeInsets.only(bottom: isPined ? 0 : 5 * height / 812),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                          visible: isPined,
                          child: SizedBox(width: 35 * width / 375)),
                      SizedBox(
                        width: 135 * width / 375,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 16 * width / 375,
                                fontWeight: FontWeight.w700,
                                color:
                                    isPined ? AppColors.black : AppColors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.subtitle,
                              style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 10 * width / 375,
                                fontWeight: FontWeight.w400,
                                color:
                                    isPined ? AppColors.black : AppColors.white,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20 * width / 375)),
                      color: AppColors.c_009FEE),
                )),
          ),
        ];
      },
      body: widget.body,
    );
  }
}
