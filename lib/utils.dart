String getExceptionMessage(Object e) {
  if (e.toString().startsWith("Exception: ")) {
    return e.toString().substring(11);
  } else {
    return e.toString();
  }
}
