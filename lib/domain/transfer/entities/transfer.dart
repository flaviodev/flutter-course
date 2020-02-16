class Transfer {
  final String id;
  final double amount;
  final int accountNumber;

  Transfer(this.id, this.amount, this.accountNumber);

  @override
  String toString() {
    return 'Transfer {id: $id, amount: $amount, accountNumber: $accountNumber}';
  }
}
