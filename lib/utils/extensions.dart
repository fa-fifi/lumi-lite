extension DurationHelper on Duration {
  String format() {
    final List<String> time = toString().split('.').first.split(':');
    final int day = int.parse(time[0]);
    final int minute = int.parse(time[1]);
    final int seconds = int.parse(time[2]);
    return '${day != 0 ? '$day hr ' : ''}${minute != 0 ? '$minute min ' : ''}$seconds sec';
  }
}
