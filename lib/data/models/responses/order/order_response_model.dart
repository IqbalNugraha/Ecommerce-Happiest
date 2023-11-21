import 'dart:convert';

class OrderResponseModel {
    final String? id;
    final String? externalId;
    final String? userId;
    final String? status;
    final String? merchantName;
    final String? merchantProfilePictureUrl;
    final int? amount;
    final String? payerEmail;
    final String? description;
    final DateTime? expiryDate;
    final String? invoiceUrl;
    final List<AvailableBank>? availableBanks;
    final List<AvailableRetailOutlet>? availableRetailOutlets;
    final List<AvailableEwallet>? availableEwallets;
    final List<AvailableQrCode>? availableQrCodes;
    final List<AvailableDirectDebit>? availableDirectDebits;
    final List<AvailablePaylater>? availablePaylaters;
    final bool? shouldExcludeCreditCard;
    final bool? shouldSendEmail;
    final DateTime? created;
    final DateTime? updated;
    final String? currency;

    OrderResponseModel({
        this.id,
        this.externalId,
        this.userId,
        this.status,
        this.merchantName,
        this.merchantProfilePictureUrl,
        this.amount,
        this.payerEmail,
        this.description,
        this.expiryDate,
        this.invoiceUrl,
        this.availableBanks,
        this.availableRetailOutlets,
        this.availableEwallets,
        this.availableQrCodes,
        this.availableDirectDebits,
        this.availablePaylaters,
        this.shouldExcludeCreditCard,
        this.shouldSendEmail,
        this.created,
        this.updated,
        this.currency,
    });

    factory OrderResponseModel.fromJson(String str) => OrderResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrderResponseModel.fromMap(Map<String, dynamic> json) => OrderResponseModel(
        id: json["id"],
        externalId: json["external_id"],
        userId: json["user_id"],
        status: json["status"],
        merchantName: json["merchant_name"],
        merchantProfilePictureUrl: json["merchant_profile_picture_url"],
        amount: json["amount"],
        payerEmail: json["payer_email"],
        description: json["description"],
        expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
        invoiceUrl: json["invoice_url"],
        availableBanks: json["available_banks"] == null ? [] : List<AvailableBank>.from(json["available_banks"]!.map((x) => AvailableBank.fromMap(x))),
        availableRetailOutlets: json["available_retail_outlets"] == null ? [] : List<AvailableRetailOutlet>.from(json["available_retail_outlets"]!.map((x) => AvailableRetailOutlet.fromMap(x))),
        availableEwallets: json["available_ewallets"] == null ? [] : List<AvailableEwallet>.from(json["available_ewallets"]!.map((x) => AvailableEwallet.fromMap(x))),
        availableQrCodes: json["available_qr_codes"] == null ? [] : List<AvailableQrCode>.from(json["available_qr_codes"]!.map((x) => AvailableQrCode.fromMap(x))),
        availableDirectDebits: json["available_direct_debits"] == null ? [] : List<AvailableDirectDebit>.from(json["available_direct_debits"]!.map((x) => AvailableDirectDebit.fromMap(x))),
        availablePaylaters: json["available_paylaters"] == null ? [] : List<AvailablePaylater>.from(json["available_paylaters"]!.map((x) => AvailablePaylater.fromMap(x))),
        shouldExcludeCreditCard: json["should_exclude_credit_card"],
        shouldSendEmail: json["should_send_email"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
        currency: json["currency"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "external_id": externalId,
        "user_id": userId,
        "status": status,
        "merchant_name": merchantName,
        "merchant_profile_picture_url": merchantProfilePictureUrl,
        "amount": amount,
        "payer_email": payerEmail,
        "description": description,
        "expiry_date": expiryDate?.toIso8601String(),
        "invoice_url": invoiceUrl,
        "available_banks": availableBanks == null ? [] : List<dynamic>.from(availableBanks!.map((x) => x.toMap())),
        "available_retail_outlets": availableRetailOutlets == null ? [] : List<dynamic>.from(availableRetailOutlets!.map((x) => x.toMap())),
        "available_ewallets": availableEwallets == null ? [] : List<dynamic>.from(availableEwallets!.map((x) => x.toMap())),
        "available_qr_codes": availableQrCodes == null ? [] : List<dynamic>.from(availableQrCodes!.map((x) => x.toMap())),
        "available_direct_debits": availableDirectDebits == null ? [] : List<dynamic>.from(availableDirectDebits!.map((x) => x.toMap())),
        "available_paylaters": availablePaylaters == null ? [] : List<dynamic>.from(availablePaylaters!.map((x) => x.toMap())),
        "should_exclude_credit_card": shouldExcludeCreditCard,
        "should_send_email": shouldSendEmail,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "currency": currency,
    };
}

class AvailableBank {
    final String? bankCode;
    final CollectionType? collectionType;
    final int? transferAmount;
    final BankBranch? bankBranch;
    final AccountHolderName? accountHolderName;
    final int? identityAmount;

    AvailableBank({
        this.bankCode,
        this.collectionType,
        this.transferAmount,
        this.bankBranch,
        this.accountHolderName,
        this.identityAmount,
    });

    factory AvailableBank.fromJson(String str) => AvailableBank.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AvailableBank.fromMap(Map<String, dynamic> json) => AvailableBank(
        bankCode: json["bank_code"],
        collectionType: collectionTypeValues.map[json["collection_type"]]!,
        transferAmount: json["transfer_amount"],
        bankBranch: bankBranchValues.map[json["bank_branch"]]!,
        accountHolderName: accountHolderNameValues.map[json["account_holder_name"]]!,
        identityAmount: json["identity_amount"],
    );

    Map<String, dynamic> toMap() => {
        "bank_code": bankCode,
        "collection_type": collectionTypeValues.reverse[collectionType],
        "transfer_amount": transferAmount,
        "bank_branch": bankBranchValues.reverse[bankBranch],
        "account_holder_name": accountHolderNameValues.reverse[accountHolderName],
        "identity_amount": identityAmount,
    };
}

enum AccountHolderName {
    HAPPIEST_STUFF
}

final accountHolderNameValues = EnumValues({
    "HAPPIEST STUFF": AccountHolderName.HAPPIEST_STUFF
});

enum BankBranch {
    VIRTUAL_ACCOUNT
}

final bankBranchValues = EnumValues({
    "Virtual Account": BankBranch.VIRTUAL_ACCOUNT
});

enum CollectionType {
    POOL
}

final collectionTypeValues = EnumValues({
    "POOL": CollectionType.POOL
});

class AvailableDirectDebit {
    final String? directDebitType;

    AvailableDirectDebit({
        this.directDebitType,
    });

    factory AvailableDirectDebit.fromJson(String str) => AvailableDirectDebit.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AvailableDirectDebit.fromMap(Map<String, dynamic> json) => AvailableDirectDebit(
        directDebitType: json["direct_debit_type"],
    );

    Map<String, dynamic> toMap() => {
        "direct_debit_type": directDebitType,
    };
}

class AvailableEwallet {
    final String? ewalletType;

    AvailableEwallet({
        this.ewalletType,
    });

    factory AvailableEwallet.fromJson(String str) => AvailableEwallet.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AvailableEwallet.fromMap(Map<String, dynamic> json) => AvailableEwallet(
        ewalletType: json["ewallet_type"],
    );

    Map<String, dynamic> toMap() => {
        "ewallet_type": ewalletType,
    };
}

class AvailablePaylater {
    final String? paylaterType;

    AvailablePaylater({
        this.paylaterType,
    });

    factory AvailablePaylater.fromJson(String str) => AvailablePaylater.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AvailablePaylater.fromMap(Map<String, dynamic> json) => AvailablePaylater(
        paylaterType: json["paylater_type"],
    );

    Map<String, dynamic> toMap() => {
        "paylater_type": paylaterType,
    };
}

class AvailableQrCode {
    final String? qrCodeType;

    AvailableQrCode({
        this.qrCodeType,
    });

    factory AvailableQrCode.fromJson(String str) => AvailableQrCode.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AvailableQrCode.fromMap(Map<String, dynamic> json) => AvailableQrCode(
        qrCodeType: json["qr_code_type"],
    );

    Map<String, dynamic> toMap() => {
        "qr_code_type": qrCodeType,
    };
}

class AvailableRetailOutlet {
    final String? retailOutletName;

    AvailableRetailOutlet({
        this.retailOutletName,
    });

    factory AvailableRetailOutlet.fromJson(String str) => AvailableRetailOutlet.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AvailableRetailOutlet.fromMap(Map<String, dynamic> json) => AvailableRetailOutlet(
        retailOutletName: json["retail_outlet_name"],
    );

    Map<String, dynamic> toMap() => {
        "retail_outlet_name": retailOutletName,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
