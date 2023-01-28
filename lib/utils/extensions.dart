extension DurationHelper on Duration {
  String format() {
    List<String> time = toString().split('.').first.split(':');
    int day = int.parse(time[0]);
    int minute = int.parse(time[1]);
    int seconds = int.parse(time[2]);
    return '${day != 0 ? '$day hr ' : ''}${minute != 0 ? '$minute ' : ''}min $seconds sec';
  }
}
