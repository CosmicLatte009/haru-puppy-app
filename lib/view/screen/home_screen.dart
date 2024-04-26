import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haru_puppy_app/util/app_color.dart';
import '../../controller/home_controller.dart';
import '../../util/app_text_style.dart';
import '../widget/card/report_card.dart';
import '../widget/navigation/top.dart';
import '../widget/profile/mate_profile_img.dart';
import '../widget/ranking/ranking_bar.dart';

class HomeScreen extends GetView<HomeController> {
  static const String route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final bottomPadding = bottomInset > 0.0 ? 20.0 : 113.0;

    String jsonData = '''
      {
        "ranking": [
          {
            "userId": 3,
            "imgUrl": "use_img_url",
            "nickname": "송이엄마",
            "role": "엄마",
            "count": 5
          },
          {
            "userId": 2,
            "imgUrl": "use_img_url",
            "nickname": "작은웅니",
            "role": "언니",

            "count": 4
          },
          {
            "userId": 1,
            "imgUrl": "use_img_url",
            "nickname": "큰웅니",
            "role": "언니",
            "count": 2
          }
        ]
      }
    ''';

    Map<String, dynamic> parsedJson = json.decode(jsonData);
    List<RankingUser> ranking =
        List<RankingUser>.from(parsedJson['ranking'].map((data) {
      return RankingUser(
        userId: data['userId'],
        imgUrl: data['imgUrl'],
        nickname: data['nickname'],
        role: data['role'],
        count: data['count'],
      );
    }));

    return Scaffold(
      appBar: CustomAppBar(
        text: '홈',
        showActions: true,
        showLeading: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31),
            child: Column(
              children: [
                SizedBox(height: 52),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/dog_profile.svg',
                      width: 140,
                      height: 140,
                    ),
                    SizedBox(width: 35),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '멍순이',
                          style: AppTextStyles.medium()
                              .copyWith(fontSize: 24, color: AppColor.black90),
                        ),
                        SizedBox(height: 14),
                        Text(
                          '성별: 여자',
                        ),
                        SizedBox(height: 5),
                        Text('생일: 22.10.23'),
                        SizedBox(height: 5),
                        Text('체중: 4.3kg')
                      ],
                    )
                  ],
                ),
                SizedBox(height: 36),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '메이트',
                      style: AppTextStyles.regular()
                          .copyWith(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MateProfileImg(nickName: '송이엄마', role: '엄마'),
                        SizedBox(width: 16),
                        MateProfileImg(nickName: '송이아빠', role: '아빠'),
                        SizedBox(width: 16),
                        MateProfileImg(nickName: '큰웅니', role: '언니'),
                        SizedBox(width: 16),
                        MateProfileImg(nickName: '작은웅니', role: '언니'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 46),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '리포트',
                      style: AppTextStyles.regular()
                          .copyWith(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 328,
                      height: 180,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 12,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 156 / 84,
                        children: [
                          ReportCard(
                            title: '지난주 산책',
                            icon: 'assets/svgs/dog_paw.svg',
                            reportValue: '9',
                            type: ReportCardType.count,
                          ),
                          ReportCard(
                            title: '오늘의 배변활동',
                            icon: 'assets/svgs/dog_poop.svg',
                            reportValue: '3',
                            type: ReportCardType.count,
                          ),
                          ReportCard(
                            title: '마지막 목욕',
                            icon: 'assets/svgs/dog_bath.svg',
                            reportValue: '12.30',
                            type: ReportCardType.date,
                          ),
                          ReportCard(
                            title: '마지막 건강검진',
                            icon: 'assets/svgs/dog_health_check.svg',
                            reportValue: '01.25',
                            type: ReportCardType.date,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 46),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '주간 산책 메이트 랭킹',
                      style: AppTextStyles.regular()
                          .copyWith(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    RankingBar(ranking: ranking)
                  ],
                ),
                SizedBox(height: bottomPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
