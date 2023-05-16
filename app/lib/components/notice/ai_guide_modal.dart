import 'package:app/components/notice/keyword_chip.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class AIGuideModal extends StatelessWidget {
  const AIGuideModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('작성하기 전', style: TextStyle(
              fontSize: subContentTextSize,
              fontWeight: FontWeight.w800,
              color: logoNavy
          )),
          Text('키워드 작성하기', style: TextStyle(
              fontSize: subTitleTextSize,
              fontWeight: FontWeight.w700
          ),),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text('- 언제, 어디서, 무엇을 했는지(할 예정인지) 적어주세요.',
              style: TextStyle(
                  fontSize: contentTextSize,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text('- 키워드가 자세할수록 정확한 내용이 나옵니다.',
              style: TextStyle(
                  fontSize: contentTextSize,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text('- 키워드의 순서도 영향을 미칠 수 있습니다.',
              style: TextStyle(
                  fontSize: contentTextSize,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 16),
            child: Text('  (예시)', style: TextStyle(fontSize: contentTextSize),),
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 6,
              runSpacing: 10,
              children: [
                KeywordChip(text: '봄 소풍', onPressed: (){}),
                KeywordChip(text: '준비물은 도시락', onPressed: (){}),
                KeywordChip(text: '9시에 출발하고 16시에 도착 예정', onPressed: (){}),
                // KeywordChip(text: '소풍 장소는 서울숲', onPressed: (){}),
                // KeywordChip(text: '즐겁게 잘 놀다 옴', onPressed: (){}),
              ],
            ),
          )
        ],
      ),
    );
  }
}