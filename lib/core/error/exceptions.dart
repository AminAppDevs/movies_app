import 'package:movies_app/core/network/error.message.model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException(this.errorMessageModel);
}
