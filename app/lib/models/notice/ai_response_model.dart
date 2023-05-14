import 'dart:convert';

AiResponseModel aiResponseModelFromJson(String str) => AiResponseModel.fromJson(json.decode(str));

String aiResponseModelToJson(AiResponseModel data) => json.encode(data.toJson());

class AiResponseModel {
  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;
  Usage usage;

  AiResponseModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory AiResponseModel.fromJson(Map<String, dynamic> json) => AiResponseModel(
    id: json["id"],
    object: json["object"],
    created: json["created"],
    model: json["model"],
    choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    usage: Usage.fromJson(json["usage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "created": created,
    "model": model,
    "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
    "usage": usage.toJson(),
  };
}

class Choice {
  String text;
  int index;
  dynamic logprobs;
  String finishReason;

  Choice({
    required this.text,
    required this.index,
    this.logprobs,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    text: json["text"],
    index: json["index"],
    logprobs: json["logprobs"],
    finishReason: json["finish_reason"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "index": index,
    "logprobs": logprobs,
    "finish_reason": finishReason,
  };
}

class Usage {
  int promptTokens;
  int completionTokens;
  int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
    promptTokens: json["prompt_tokens"],
    completionTokens: json["completion_tokens"],
    totalTokens: json["total_tokens"],
  );

  Map<String, dynamic> toJson() => {
    "prompt_tokens": promptTokens,
    "completion_tokens": completionTokens,
    "total_tokens": totalTokens,
  };
}