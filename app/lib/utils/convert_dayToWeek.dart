String getDayOfWeek(int year, int month, int day) {
  // DateTime 객체 생성
  DateTime dateTime = DateTime(year, month, day);

  // 요일을 나타내는 정수 (1부터 일요일, 7까지 토요일)
  int weekday = dateTime.weekday;

  // 정수에 따라 요일 문자열 반환
  switch (weekday) {
    case 1:
      return '월요일';
    case 2:
      return '화요일';
    case 3:
      return '수요일';
    case 4:
      return '목요일';
    case 5:
      return '금요일';
    case 6:
      return '토요일';
    case 7:
      return '일요일';
    default:
      return '';
  }
}