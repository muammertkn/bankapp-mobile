class Endpoints {
  static String baseUrl = 'http://bankapp.aziznal.com:3000/';
  static String signIn = baseUrl + 'auth/login';
  static String signUp = baseUrl + 'auth/register';
  static String verify = baseUrl + 'auth/verify';
  static String getFullUserData = baseUrl + 'u/';
  static String updateUser = baseUrl + 'u/update-user';
  static String getAccounts = baseUrl + 'u/accounts';
  static String getTransactions = baseUrl + 'u/transactions';
  static String forCharTransactions = baseUrl + 'u/transactions?forChart=true';
  static String createAccount = baseUrl + 'u/create-account';
  static String updateAccount = baseUrl + 'u/update-account';
  static String deleteAccount = baseUrl + 'u/delete-account';
  static String sendMoney = baseUrl + 'u/send-money';
  static String borrowMoney = baseUrl + 'u/borrow-money';
}
