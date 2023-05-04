class CatResponse {
  final String fact;
  final int length;

  const CatResponse({required this.fact, required this.length});

  factory CatResponse.fromJson(Map<String, dynamic> json) =>
      CatResponse(fact: json['fact'], length: json['length']);

  Map<String, dynamic> toJson() => {
        'fact': fact,
        'length': length,
      };
}
