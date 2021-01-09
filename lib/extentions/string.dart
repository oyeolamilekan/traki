extension StringExtension on String {
  bool validateEmail() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(this);
  }

  bool strip() {
    return this.replaceAll(new RegExp(r"\s+"), "").length == 0;
  }

  String removeSpace() {
    return this.replaceAll(new RegExp(r"\s+"), "");
  }
}
