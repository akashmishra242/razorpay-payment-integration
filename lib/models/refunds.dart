class Refund {
  final String id;
  final String entity;
  final int amount;
  final String currency;
  final String paymentId;
  final Notes notes;
  final String? receipt;
  final AcquirerData acquirerData;
  final int createdAt;
  final String? batchId;
  final String status;
  final String speedProcessed;
  final String speedRequested;

  Refund({
    required this.id,
    required this.entity,
    required this.amount,
    required this.currency,
    required this.paymentId,
    required this.notes,
    required this.acquirerData,
    required this.createdAt,
    this.receipt,
    required this.batchId,
    required this.status,
    required this.speedProcessed,
    required this.speedRequested,
  });

  factory Refund.fromJson(Map<String, dynamic> json) {
    return Refund(
      id: json['id'],
      entity: json['entity'],
      amount: json['amount'],
      currency: json['currency'],
      paymentId: json['payment_id'],
      notes: Notes.fromJson(json['notes']),
      receipt: json['receipt'],
      acquirerData: AcquirerData.fromJson(json['acquirer_data']),
      createdAt: json['created_at'],
      batchId: json['batch_id'],
      status: json['status'],
      speedProcessed: json['speed_processed'],
      speedRequested: json['speed_requested'],
    );
  }
}

class Notes {
  final String comment;

  Notes({required this.comment});

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(comment: json['comment']);
  }
}

class AcquirerData {
  final String arn;

  AcquirerData({required this.arn});

  factory AcquirerData.fromJson(Map<String, dynamic> json) {
    return AcquirerData(arn: json['arn']);
  }
}

class Collection {
  final String entity;
  final int count;
  final List<Refund> items;

  Collection({
    required this.entity,
    required this.count,
    required this.items,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    var itemData = json['items'] as List<dynamic>;
    List<Refund> refundItems = itemData.map((item) => Refund.fromJson(item)).toList();

    return Collection(
      entity: json['entity'],
      count: json['count'],
      items: refundItems,
    );
  }
}
