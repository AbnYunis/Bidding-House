import 'dart:async';

import 'package:bidding_house/core/utils/imports.dart';

class CountdownTimer extends StatefulWidget {
  final String deadlineString;
  final void Function(Duration?) onTimerEnd;
  const CountdownTimer({super.key, required this.deadlineString, required this.onTimerEnd});

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late DateTime deadline; // Set your deadline here
  late Timer _timer;
  Duration _timeRemaining = const Duration();

  @override
  void initState() {
    super.initState();
    deadline = DateTime.parse(widget.deadlineString);
    _startTimer();
  }

  void _startTimer() {
    _timeRemaining = deadline.difference(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeRemaining = deadline.difference(DateTime.now());
        widget.onTimerEnd(_timeRemaining);
        if (_timeRemaining.isNegative) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    int days = duration.inDays;
    int hours = duration.inHours.remainder(24);
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return '$days Days ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _timeRemaining.isNegative
            ? 'Sold Out'
            : _formatDuration(_timeRemaining),
        style: AppTextStyles.style12_800(context, CustomColor.white),
      ),
    );
  }
}