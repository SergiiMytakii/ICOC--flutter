import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/remote/ai_data_source.dart';
import 'package:icoc/main.dart';
import 'package:injectable/injectable.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

@dev
@prod
@Injectable(as: AiDataSource)
class AiDataSourceImpl implements AiDataSource {
  final llm = ChatOpenAI(
    apiKey: openAIKey,
    defaultOptions: const ChatOpenAIOptions(
        model: 'gpt-4o-mini',
        temperature: 0.2,
        responseFormat: ChatOpenAIResponseFormat.jsonObject),
  );
  @override
  Future<Map<String, dynamic>> getAiResponse(
      PromptTemplate promptTemplate, Map<String, dynamic> query) async {
    final chain = promptTemplate.pipe(llm).pipe(JsonOutputParser());
    try {
      final result = await chain.invoke(query);
      return result;
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace);
      return {};
    }
  }

  @override
  Future<String> getAiStringResponse(
      PromptTemplate promptTemplate, Map<String, dynamic> query) async {
    final chain = promptTemplate.pipe(llm);
    try {
      final result = await chain.invoke(query);
      return result.output.content;
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace);
      return '';
    }
  }
}
