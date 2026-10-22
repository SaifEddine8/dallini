class Utils {
  
   static bool isValidEmail(String email) {
    String pattern=r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
      return RegExp(pattern).hasMatch(email);
    }

    static bool isValidPassword(String password) {
    String pattern=r'^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$';
      return RegExp(pattern).hasMatch(password);
    }

    static bool isValidPhone(String phone) {
    String pattern=r'(?:([+]\d{1,4})[-.\s]?)?(?:[(](\d{1,3})[)][-.\s]?)?(\d{1,4})[-.\s]?(\d{1,4})[-.\s]?(\d{1,9})';
      return RegExp(pattern).hasMatch(phone);
    }
}