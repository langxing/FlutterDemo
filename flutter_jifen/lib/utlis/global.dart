///字符串转color
int hexToColor(String code) {
  try {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  } catch (e, _) {
    return 0x00000000;
  }
}