void putDeviceLangToFirstPlace(List<String> allTitleKeys, String locale) {
  if (allTitleKeys.contains(locale)) {
    allTitleKeys.remove(locale);
  }
  allTitleKeys.insert(0, locale);
}
