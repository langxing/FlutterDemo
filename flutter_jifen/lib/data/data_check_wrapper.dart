
class DataCheckWrapper {
  static String stringFromDynamic(dynamic number) => number?.toString();

  static int intFromDynamic(dynamic number) => number is int ? number : int.tryParse(number.toString()) ?? 0;
}
