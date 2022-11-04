import 'dart:math';

class GenPass {
  static String generate() {
    var chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    return List.generate(20, (index) {
      return chars[(Random.secure().nextInt(chars.length))];
    }).join();
  }
}
