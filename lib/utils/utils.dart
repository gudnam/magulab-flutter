String removeWhiteSpace(String str) {
  return str.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
}
