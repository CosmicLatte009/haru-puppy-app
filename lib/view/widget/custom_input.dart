import 'package:flutter/material.dart';
import 'package:haru_puppy_app/util/app_color.dart';
import '../../util/app_text_style.dart';

class CustomInput extends StatefulWidget {
  const CustomInput(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller});

  final String label;
  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: AppTextStyles.regular()),
          SizedBox(height: 14),
          SizedBox(
            width: 340,
            height: 48,
            child: TextField(
              controller: myController,
              style: AppTextStyles.regular(),
              cursorColor: AppColor.black90,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle:
                    AppTextStyles.regular().copyWith(color: AppColor.black70),
                // 입력 필드의 테두리 스타일
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.black50, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.main, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // 입력 완료(키보드에서 완료 버튼 클릭)시 호출되는 콜백
              onSubmitted: (String value) {
                // 여기서 사용자 입력 처리를 할 수 있습니다.
                print('입력된 이름: $value');
              },
            ),
          ),
        ],
      ),
    );
  }
}
