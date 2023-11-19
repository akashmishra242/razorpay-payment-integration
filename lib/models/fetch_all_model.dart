// To parse this JSON data, do
//
//     final fetchAllPaymentModel = fetchAllPaymentModelFromJson(jsonString);

import 'dart:convert';

FetchAllPaymentModel fetchAllPaymentModelFromJson(String str) => FetchAllPaymentModel.fromJson(json.decode(str));

String fetchAllPaymentModelToJson(FetchAllPaymentModel data) => json.encode(data.toJson());

class FetchAllPaymentModel {
    final String? entity;
    final int? count;
    final List<Item> items;

    FetchAllPaymentModel({
        this.entity,
        this.count,
        required this.items,
    });

    FetchAllPaymentModel copyWith({
        String? entity,
        int? count,
        List<Item>? items,
    }) => 
        FetchAllPaymentModel(
            entity: entity ?? this.entity,
            count: count ?? this.count,
            items: items ?? this.items,
        );

    factory FetchAllPaymentModel.fromJson(Map<String, dynamic> json) => FetchAllPaymentModel(
        entity: json["entity"],
        count: json["count"],
        items: json["items"] = List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "entity": entity,
        "count": count,
        // ignore: unnecessary_null_comparison
        "items": items == null ? [] : List<Item>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    final String? id;
    final String? entity;
    final int? amount;
    final String? currency;
    final String? status;
    final dynamic orderId;
    final dynamic invoiceId;
    final bool? international;
    final String? method;
    final int? amountRefunded;
    final dynamic refundStatus;
    final bool? captured;
    final String? description;
    final dynamic cardId;
    final String? bank;
    final dynamic wallet;
    final String? vpa;
    final String? email;
    final String? contact;
    final Notes? notes;
    final dynamic fee;
    final dynamic tax;
    final dynamic errorCode;
    final dynamic errorDescription;
    final dynamic errorSource;
    final dynamic errorStep;
    final dynamic errorReason;
    final AcquirerData? acquirerData;
    final int? createdAt;

    Item({
        this.id,
        this.entity,
        this.amount,
        this.currency,
        this.status,
        this.orderId,
        this.invoiceId,
        this.international,
        this.method,
        this.amountRefunded,
        this.refundStatus,
        this.captured,
        this.description,
        this.cardId,
        this.bank,
        this.wallet,
        this.vpa,
        this.email,
        this.contact,
        this.notes,
        this.fee,
        this.tax,
        this.errorCode,
        this.errorDescription,
        this.errorSource,
        this.errorStep,
        this.errorReason,
        this.acquirerData,
        this.createdAt,
    });

    Item copyWith({
        String? id,
        String? entity,
        int? amount,
        String? currency,
        String? status,
        dynamic orderId,
        dynamic invoiceId,
        bool? international,
        String? method,
        int? amountRefunded,
        dynamic refundStatus,
        bool? captured,
        String? description,
        dynamic cardId,
        String? bank,
        dynamic wallet,
        String? vpa,
        String? email,
        String? contact,
        Notes? notes,
        dynamic fee,
        dynamic tax,
        dynamic errorCode,
        dynamic errorDescription,
        dynamic errorSource,
        dynamic errorStep,
        dynamic errorReason,
        AcquirerData? acquirerData,
        int? createdAt,
    }) => 
        Item(
            id: id ?? this.id,
            entity: entity ?? this.entity,
            amount: amount ?? this.amount,
            currency: currency ?? this.currency,
            status: status ?? this.status,
            orderId: orderId ?? this.orderId,
            invoiceId: invoiceId ?? this.invoiceId,
            international: international ?? this.international,
            method: method ?? this.method,
            amountRefunded: amountRefunded ?? this.amountRefunded,
            refundStatus: refundStatus ?? this.refundStatus,
            captured: captured ?? this.captured,
            description: description ?? this.description,
            cardId: cardId ?? this.cardId,
            bank: bank ?? this.bank,
            wallet: wallet ?? this.wallet,
            vpa: vpa ?? this.vpa,
            email: email ?? this.email,
            contact: contact ?? this.contact,
            notes: notes ?? this.notes,
            fee: fee ?? this.fee,
            tax: tax ?? this.tax,
            errorCode: errorCode ?? this.errorCode,
            errorDescription: errorDescription ?? this.errorDescription,
            errorSource: errorSource ?? this.errorSource,
            errorStep: errorStep ?? this.errorStep,
            errorReason: errorReason ?? this.errorReason,
            acquirerData: acquirerData ?? this.acquirerData,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        entity: json["entity"],
        amount: json["amount"],
        currency: json["currency"],
        status: json["status"],
        orderId: json["order_id"],
        invoiceId: json["invoice_id"],
        international: json["international"],
        method: json["method"],
        amountRefunded: json["amount_refunded"],
        refundStatus: json["refund_status"],
        captured: json["captured"],
        description: json["description"],
        cardId: json["card_id"],
        bank: json["bank"],
        wallet: json["wallet"],
        vpa: json["vpa"],
        email: json["email"],
        contact: json["contact"],
     //   notes: json["notes"] == null ? null : Notes.fromJson(json["notes"]),
        fee: json["fee"],
        tax: json["tax"],
        errorCode: json["error_code"],
        errorDescription: json["error_description"],
        errorSource: json["error_source"],
        errorStep: json["error_step"],
        errorReason: json["error_reason"],
        //acquirerData: json["acquirer_data"] == null ? null : AcquirerData.fromJson(json["acquirer_data"]),
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entity": entity,
        "amount": amount,
        "currency": currency,
        "status": status,
        "order_id": orderId,
        "invoice_id": invoiceId,
        "international": international,
        "method": method,
        "amount_refunded": amountRefunded,
        "refund_status": refundStatus,
        "captured": captured,
        "description": description,
        "card_id": cardId,
        "bank": bank,
        "wallet": wallet,
        "vpa": vpa,
        "email": email,
        "contact": contact,
        "notes": notes?.toJson(),
        "fee": fee,
        "tax": tax,
        "error_code": errorCode,
        "error_description": errorDescription,
        "error_source": errorSource,
        "error_step": errorStep,
        "error_reason": errorReason,
        "acquirer_data": acquirerData?.toJson(),
        "created_at": createdAt,
    };
}

class AcquirerData {
    final String? bankTransactionId;
    final String? rrn;
    final String? upiTransactionId;

    AcquirerData({
        this.bankTransactionId,
        this.rrn,
        this.upiTransactionId,
    });

    AcquirerData copyWith({
        String? bankTransactionId,
        String? rrn,
        String? upiTransactionId,
    }) => 
        AcquirerData(
            bankTransactionId: bankTransactionId ?? this.bankTransactionId,
            rrn: rrn ?? this.rrn,
            upiTransactionId: upiTransactionId ?? this.upiTransactionId,
        );

    factory AcquirerData.fromJson(Map<String, dynamic> json) => AcquirerData(
        bankTransactionId: json["bank_transaction_id"],
        rrn: json["rrn"],
        upiTransactionId: json["upi_transaction_id"],
    );

    Map<String, dynamic> toJson() => {
        "bank_transaction_id": bankTransactionId,
        "rrn": rrn,
        "upi_transaction_id": upiTransactionId,
    };
}

class Notes {
    final String? address;

    Notes({
        this.address,
    });

    Notes copyWith({
        String? address,
    }) => 
        Notes(
            address: address ?? this.address,
        );

    factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
    };
}
