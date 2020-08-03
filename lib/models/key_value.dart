class KeyValue {
  KeyValue(this.key, this.value);

  factory KeyValue.fromMap(Map<String, dynamic> map) {
    return KeyValue(
      map['key'].toString(),
      map['value'].toString(),
    );
  }

  final String key;
  final String value;
}
