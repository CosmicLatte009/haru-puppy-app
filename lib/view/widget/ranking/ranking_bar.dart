import 'package:flutter/material.dart';
import 'dart:math';
import '../../../util/app_color.dart';
import '../../../util/app_text_style.dart';

// 모델 클래스 정의
class RankingUser {
  final int userId;
  final String imgUrl;
  final String nickname;
  final String role;
  final int count;

  RankingUser({
    required this.userId,
    required this.imgUrl,
    required this.nickname,
    required this.role,
    required this.count,
  });
}

class RankingBar extends StatelessWidget {
  RankingBar({Key? key, required this.ranking}) : super(key: key);

  final List<RankingUser> ranking;
  final Color randomColor = getRandomColor();

  static Color getRandomColor() {
    Random random = Random(); // Random 객체 생성
    // 랜덤 색상 생성: 0에서 255 사이의 랜덤 값을 RGB 색상으로 변환
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      0.25, // Alpha 값
    );
  }

  @override
  Widget build(BuildContext context) {
    // 랭킹을 count 기준으로 내림차순 정렬
    List<RankingUser> sortedRanking = List.from(ranking)
      ..sort((a, b) => b.count.compareTo(a.count));

    List<Widget> rankingWidgets = List.filled(sortedRanking.length, SizedBox());

    if (sortedRanking.length == 1) {
      rankingWidgets[0] = buildBar(sortedRanking[0], 1);
    } else {
      int centerIndex =
          sortedRanking.length == 2 ? 1 : (sortedRanking.length - 1) ~/ 2;
      // 1순위 중앙 배치
      rankingWidgets[centerIndex] = buildBar(sortedRanking[0], 1);
      // 나머지 순위 배치
      for (int i = 1; i < sortedRanking.length; i++) {
        if (i <= centerIndex) {
          rankingWidgets[centerIndex - i] = buildBar(sortedRanking[i], i + 1);
        } else {
          rankingWidgets[i] = buildBar(sortedRanking[i], i + 1);
        }
      }
    }
    return SizedBox(
      height: 303,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: rankingWidgets,
      ),
    );
  }

  Widget buildBar(RankingUser user, int rank) {
    double height;
    Color color;
    switch (rank) {
      case 1:
        height = 130; // 1순위 높이
        color = Color(0xFF929292);
        break;
      case 2:
        height = 95; // 2순위 높이
        color = Color(0xFFADADAD);
        break;
      case 3:
      default:
        height = user.count != 0 ? 72 : 5; // 3순위 높이
        color = Color(0xFFD8D8D8);
        break;
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: randomColor,
          ),
          SizedBox(height: 8),
          Text(
            user.nickname,
            style: AppTextStyles.regular().copyWith(fontSize: 16),
          ),
          Text(
            user.role,
            style: AppTextStyles.regular().copyWith(color: AppColor.black80),
          ),
          SizedBox(height: 8),
          Text(
            '${user.count}회',
            style: AppTextStyles.regular()
                .copyWith(fontSize: 16, color: AppColor.black70),
          ),
          SizedBox(height: 12),
          Container(
            width: 80,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
