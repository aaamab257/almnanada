// import 'dart:developer';
// import 'dart:io';
// import 'package:kayesh/core/index.dart';

// class NetworkExceptions {
//   const NetworkExceptions();

//   static NetworkExceptions handleResponse(Response? response) {
//     List<String> errors = [];
//     if (response?.data["data"] != null && response?.data["data"] != "") {
//       (response?.data["data"] as Map<String, dynamic>).forEach((key, value) {
//         errors.add("${value.first}");
//       });
//     } else {
//       errors.add(response?.data["Message"]);
//     }

//     final String error =
//         errors.toString().replaceAll("[", "").replaceAll("]", "").trim();
//     int statusCode = response?.statusCode ?? 0;
//     switch (statusCode) {
//       case 400:
//         return BadRequest(error);
//       case 401:
//       case 403:
//         Get.offNamedUntil(Routes.login, (route) => false);
//         return UnauthorizedRequest(error);
//       case 404:
//         return NotFound();
//       case 409:
//         return Conflict();
//       case 408:
//         return RequestTimeout();
//       case 422:
//         return UnprocessableEntity(error);
//       case 500:
//         return InternalServerError();
//       case 503:
//         return ServiceUnavailable();
//       default:
//         int responseCode = statusCode;
//         return DefaultError(
//           "Received invalid status code: $responseCode",
//         );
//     }
//   }

//   static NetworkExceptions getDioException(error) {
//     if (error is Exception) {
//       try {
//         NetworkExceptions networkExceptions;
//         if (error is DioError) {
//           switch (error.type) {
//             case DioErrorType.cancel:
//               networkExceptions = RequestCancelled();
//               break;
//             case DioErrorType.connectTimeout:
//               networkExceptions = RequestTimeout();
//               break;
//             case DioErrorType.other:
//               networkExceptions = NoInternetConnection();
//               break;
//             case DioErrorType.receiveTimeout:
//               networkExceptions = SendTimeout();
//               break;
//             case DioErrorType.response:
//               log("========> ${error.response}");
//               networkExceptions = handleResponse(error.response);
//               break;
//             case DioErrorType.sendTimeout:
//               networkExceptions = SendTimeout();
//               break;
//           }
//         } else if (error is SocketException) {
//           networkExceptions = NoInternetConnection();
//         } else {
//           networkExceptions = UnexpectedError();
//         }
//         return networkExceptions;
//       } on FormatException catch (_) {
//         return FormatException();
//       } catch (_) {
//         return UnexpectedError();
//       }
//     } else {
//       if (error.toString().contains("is not a subtype of")) {
//         if (kDebugMode) log("error =====> $error");
//         return UnableToProcess();
//       } else {
//         return UnexpectedError();
//       }
//     }
//   }

//   static String getErrorMessage(NetworkExceptions networkExceptions) {
//     String message = "";
//     if (networkExceptions is NotFound) {
//       message = "Not Found";
//     } else if (networkExceptions is NoInternetConnection) {
//       message = "No internet connection";
//     } else if (networkExceptions is RequestCancelled) {
//       message = "Request Cancelled";
//     } else if (networkExceptions is InternalServerError) {
//       message = "Internal Server Error";
//     } else if (networkExceptions is ServiceUnavailable) {
//       message = "Service unavailable";
//     } else if (networkExceptions is MethodNotAllowed) {
//       message = "Method Allowed";
//     } else if (networkExceptions is BadRequest) {
//       message = networkExceptions.error;
//     } else if (networkExceptions is UnauthorizedRequest) {
//       message = networkExceptions.error;
//     } else if (networkExceptions is UnprocessableEntity) {
//       message = networkExceptions.error;
//     } else if (networkExceptions is UnexpectedError) {
//       message = "Unexpected error occurred";
//     } else if (networkExceptions is RequestTimeout) {
//       message = "Connection request timeout";
//     } else if (networkExceptions is Conflict) {
//       message = "Error due to a conflict";
//     } else if (networkExceptions is SendTimeout) {
//       message = "Send timeout in connection with API server";
//     } else if (networkExceptions is UnableToProcess) {
//       message = "Unable to process the data";
//     } else if (networkExceptions is DefaultError) {
//       message = networkExceptions.error;
//     } else if (networkExceptions is FormatException) {
//       message = "Unexpected error occurred";
//     } else if (networkExceptions is NotAcceptable) {
//       message = "Not acceptable";
//     }

//     return message.tr;
//   }
// }

// class RequestCancelled extends NetworkExceptions {}

// class UnauthorizedRequest extends NetworkExceptions {
//   final String error;

//   UnauthorizedRequest(this.error);
// }

// class BadRequest extends NetworkExceptions {
//   final String error;

//   BadRequest(this.error);
// }

// class NotFound extends NetworkExceptions {}

// class MethodNotAllowed extends NetworkExceptions {}

// class NotAcceptable extends NetworkExceptions {}

// class RequestTimeout extends NetworkExceptions {}

// class SendTimeout extends NetworkExceptions {}

// class UnprocessableEntity extends NetworkExceptions {
//   final String error;

//   UnprocessableEntity(this.error);
// }

// class Conflict extends NetworkExceptions {}

// class InternalServerError extends NetworkExceptions {}

// class NotImplemented extends NetworkExceptions {}

// class ServiceUnavailable extends NetworkExceptions {}

// class NoInternetConnection extends NetworkExceptions {}

// class FormatException extends NetworkExceptions {}

// class UnableToProcess extends NetworkExceptions {}

// class DefaultError extends NetworkExceptions {
//   final String error;

//   DefaultError(this.error);
// }

// class UnexpectedError extends NetworkExceptions {}
