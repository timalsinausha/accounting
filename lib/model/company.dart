class Company {
  String formalName;
  String booksFrom;
  String gstNumber;
  String address;
  String corporateidentityNumber;
  String countryName;
  String currencyName;
  String currencySymbol;
  String email;
  String guid;
  String incometaxNumber;
  String interstatestNumber;
  String name;
  String ownerName;
  String phoneNumber;
  String pincode;
  String startingFrom;
  String stateName;
  String hasLogo;
  DateTime lastSyncedAt;
  DateTime lastEntryDate;

  Company(
      {this.booksFrom = '',
      this.formalName = '',
      this.gstNumber = '',
      this.address = '',
      this.corporateidentityNumber = '',
      this.countryName = '',
      this.currencyName = '',
      this.currencySymbol = '',
      this.email = '',
      this.guid = '',
      this.incometaxNumber = '',
      this.interstatestNumber = '',
      this.name = '',
      this.ownerName = '',
      this.phoneNumber = '',
      this.pincode = '',
      this.startingFrom = '',
      this.stateName = '',
      this.hasLogo = '',
      required DateTime lastEntryDate,
      required DateTime lastSyncedAt})
      : this.lastSyncedAt = lastSyncedAt,
        this.lastEntryDate = lastEntryDate;
}
