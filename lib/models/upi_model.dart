// To parse this JSON data, do
//
//     final upiModel = upiModelFromJson(jsonString);

import 'dart:convert';

UpiModel upiModelFromJson(String str) => UpiModel.fromJson(json.decode(str));

String upiModelToJson(UpiModel data) => json.encode(data.toJson());

class UpiModel {
  final String? id;
  final String? entity;
  final int? amount;
  final String? currency;
  final String? status;
  final String? orderId;
  final String? invoiceId;
  final bool? international;
  final String? method;
  final int? amountRefunded;
  final dynamic refundStatus;
  final bool? captured;
  final String? description;
  final dynamic cardId;
  final dynamic bank;
  final dynamic wallet;
  final String? vpa;
  final dynamic email;
  final String? contact;
  final List<dynamic>? notes;
  final int? fee;
  final int? tax;
  final dynamic errorCode;
  final dynamic errorDescription;
  final dynamic errorSource;
  final dynamic errorStep;
  final dynamic errorReason;
  final AcquirerData? acquirerData;
  final int? createdAt;
  final Upi? upi;

  UpiModel({
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
    this.upi,
  });

  UpiModel copyWith({
    String? id,
    String? entity,
    int? amount,
    String? currency,
    String? status,
    String? orderId,
    String? invoiceId,
    bool? international,
    String? method,
    int? amountRefunded,
    dynamic refundStatus,
    bool? captured,
    String? description,
    dynamic cardId,
    dynamic bank,
    dynamic wallet,
    String? vpa,
    dynamic email,
    String? contact,
    List<dynamic>? notes,
    int? fee,
    int? tax,
    dynamic errorCode,
    dynamic errorDescription,
    dynamic errorSource,
    dynamic errorStep,
    dynamic errorReason,
    AcquirerData? acquirerData,
    int? createdAt,
    Upi? upi,
  }) =>
      UpiModel(
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
        upi: upi ?? this.upi,
      );

  factory UpiModel.fromJson(Map<String, dynamic> json) => UpiModel(
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
        notes: json["notes"] == null
            ? []
            : List<dynamic>.from(json["notes"]!.map((x) => x)),
        fee: json["fee"],
        tax: json["tax"],
        errorCode: json["error_code"],
        errorDescription: json["error_description"],
        errorSource: json["error_source"],
        errorStep: json["error_step"],
        errorReason: json["error_reason"],
        acquirerData: json["acquirer_data"] == null
            ? null
            : AcquirerData.fromJson(json["acquirer_data"]),
        createdAt: json["created_at"],
        upi: json["upi"] == null ? null : Upi.fromJson(json["upi"]),
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
        "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
        "fee": fee,
        "tax": tax,
        "error_code": errorCode,
        "error_description": errorDescription,
        "error_source": errorSource,
        "error_step": errorStep,
        "error_reason": errorReason,
        "acquirer_data": acquirerData?.toJson(),
        "created_at": createdAt,
        "upi": upi?.toJson(),
      };
}

class AcquirerData {
  final String? rrn;

  AcquirerData({
    this.rrn,
  });

  AcquirerData copyWith({
    String? rrn,
  }) =>
      AcquirerData(
        rrn: rrn ?? this.rrn,
      );

  factory AcquirerData.fromJson(Map<String, dynamic> json) => AcquirerData(
        rrn: json["rrn"],
      );

  Map<String, dynamic> toJson() => {
        "rrn": rrn,
      };
}

class Upi {
  final String? vpa;

  Upi({
    this.vpa,
  });

  Upi copyWith({
    String? vpa,
  }) =>
      Upi(
        vpa: vpa ?? this.vpa,
      );

  factory Upi.fromJson(Map<String, dynamic> json) => Upi(
        vpa: json["vpa"],
      );

  Map<String, dynamic> toJson() => {
        "vpa": vpa,
      };
}
