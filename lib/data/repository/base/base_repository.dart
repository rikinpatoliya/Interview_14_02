import 'package:flutter/widgets.dart';
import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/core/utils/logger.dart';
import 'package:rikin_interview_14_02/data/dio/network_exceptions.dart';

abstract class BaseRepository {
  @protected
  Future<ApiResponse<T>> apiCall<T>({
    // BuildContext context,
    required Future<T> Function() request,
    bool showProgress = false,
  }) async {
    try {
      // if (showProgress) showProgressDialog(context);

      T baseResponse = await request();
      return ApiResponse.success(baseResponse);
    } catch (error) {
      logger.e(error);
      NetworkExceptions networkExcl = NetworkExceptions.getDioException(error);
      var message = NetworkExceptions.getErrorMessage(networkExcl);

      // networkExcl.maybeWhen(
      //   unauthorizedRequest: () async {
      //     removeSessionSendLogin();
      //   },
      //   orElse: () {},
      // );
      return ApiResponse.error(message);
    }
    // finally {
    //   if (showProgress) dismissDialog();
    // }
  }
}
