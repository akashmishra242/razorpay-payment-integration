// To parse this JSON data, do
//
//     final fetchAllRefundModel = fetchAllRefundModelFromJson(jsonString);

import 'dart:convert';

FetchAllRefundModel fetchAllRefundModelFromJson(String str) => FetchAllRefundModel.fromJson(json.decode(str));

String fetchAllRefundModelToJson(FetchAllRefundModel data) => json.encode(data.toJson());

class FetchAllRefundModel {
    final String? entity;
    final int? count;
    final List<Item> items;

    FetchAllRefundModel({
        this.entity,
        this.count,
        required this.items,
    });

    factory FetchAllRefundModel.fromJson(Map<String, dynamic> json) => FetchAllRefundModel(
        entity: json["entity"],
        count: json["count"],
        items: json["items"] = List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "entity": entity,
        "count": count,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    final String? id;
    final String? entity;
    final int? amount;
    final String? currency;
    final String? paymentId;
    final Notes? notes;
    final dynamic receipt;
    final AcquirerData? acquirerData;
    final int? createdAt;
    final dynamic batchId;
    final String? status;
    final String? speedProcessed;
    final String? speedRequested;

    Item({
        this.id,
        this.entity,
        this.amount,
        this.currency,
        this.paymentId,
        this.notes,
        this.receipt,
        this.acquirerData,
        this.createdAt,
        this.batchId,
        this.status,
        this.speedProcessed,
        this.speedRequested,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        entity: json["entity"],
        amount: json["amount"],
        currency: json["currency"],
        paymentId: json["payment_id"],
      //  notes: json["notes"] == null ? null : Notes.fromJson(json["notes"]),
        receipt: json["receipt"],
      //  acquirerData: json["acquirer_data"] == null ? null : AcquirerData.fromJson(json["acquirer_data"]),
        createdAt: json["created_at"],
        batchId: json["batch_id"],
        status: json["status"],
        speedProcessed: json["speed_processed"],
        speedRequested: json["speed_requested"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entity": entity,
        "amount": amount,
        "currency": currency,
        "payment_id": paymentId,
      //  "notes": notes?.toJson(),
        "receipt": receipt,
        //"acquirer_data": acquirerData?.toJson(),
        "created_at": createdAt,
        "batch_id": batchId,
        "status": status,
        "speed_processed": speedProcessed,
        "speed_requested": speedRequested,
    };
}

class AcquirerData {
    final String? arn;

    AcquirerData({
        this.arn,
    });

    factory AcquirerData.fromJson(Map<String, dynamic> json) => AcquirerData(
        arn: json["arn"],
    );

    Map<String, dynamic> toJson() => {
        "arn": arn,
    };
}

class Notes {
    final String? comment;

    Notes({
        this.comment,
    });

    factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "comment": comment,
    };
}
