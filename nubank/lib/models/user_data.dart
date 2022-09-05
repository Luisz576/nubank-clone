class UserData{

  final double totalCash, invoice, cardLimit;
  final bool automaticDebitActive;

  UserData({required this.totalCash, required this.invoice, required this.cardLimit, required this.automaticDebitActive});
  factory UserData.empty(){
    return UserData(
      automaticDebitActive: false,
      cardLimit: 0,
      invoice: 0,
      totalCash: 0
    );
  }
}