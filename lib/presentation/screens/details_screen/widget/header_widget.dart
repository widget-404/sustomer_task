import 'package:flutter/material.dart';
import 'package:sustomer_task/export.dart';

class Header extends StatelessWidget {
  final String name;
  final Function? onBack;

  const Header({Key? key, this.name = '', this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes.heightRatio * 250,
      color: colors.accentSecondary,
      child: Column(
        children: [
          verticalSpacer(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              horizontalSpacer(20),
              GestureDetector(
                onTap: () {
                  onBack!();
                },
                // child: SvgPicture.asset(assets.icBack),
              ),
            ],
          ),
          const Spacer(),
          Text(
            name,
            style: TextStyle(
                fontSize: sizes.fontRatio * 34,
                fontWeight: FontWeight.w900,
                color: colors.naturalWhite),
          ),
          Text(
            'CORONA STATS OVERVIEW',
            style: TextStyle(
                fontSize: sizes.fontRatio * 12,
                fontWeight: FontWeight.w900,
                color: colors.naturalWhite),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
