import 'package:langchain/langchain.dart';

abstract class AiDataSource {
  Future<Map<String, dynamic>> getAiResponse(
      PromptTemplate question, Map<String, dynamic> query);
  Future<String> getAiStringResponse(
      PromptTemplate promptTemplate, Map<String, dynamic> query);
}
