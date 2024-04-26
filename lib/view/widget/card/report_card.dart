import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../util/app_color.dart';
import '../../../util/app_text_style.dart';

enum ReportCardType { count, date }

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.title,
    required this.icon,
    required this.reportValue,
    required this.type,
  });

  final String title;
  final String icon;
  final String reportValue;
  final ReportCardType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.black60, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(title),
        SizedBox(height: 4),
        Row(
          children: [
            type == ReportCardType.count
                ? SizedBox(width: 38)
                : SizedBox(width: 27),
            SvgPicture.asset(icon, width: 24, height: 24),
            SizedBox(width: 6),
            Text(reportValue, style: AppTextStyles.medium(fontSize: 28)),
            SizedBox(width: 3),
            type == ReportCardType.count
                ? Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text('회'),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ]),
    );
  }
}
