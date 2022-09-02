import 'package:meta/meta.dart';

@immutable
class Time {
  final String location;
  final String time;
  final bool isFetching;
  final bool isError;

  const Time({
    required this.location,
    required this.time,
    required this.isFetching,
    required this.isError,
  });

  factory Time.initial() {
    return Time(location: "", time: "00:00", isFetching: false, isError: false);
  }

  Time copyWith({
    String? location,
    String? time,
    bool? isFetching,
    bool? isError,
  }) {
    return Time(
      location: location ?? this.location,
      time: time ?? this.time,
      isFetching: isFetching ?? this.isFetching,
      isError: isError ?? this.isError,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Time &&
          runtimeType == other.runtimeType &&
          location == other.location &&
          time == other.time;

  @override
  int get hashCode => location.hashCode ^ time.hashCode;
}
