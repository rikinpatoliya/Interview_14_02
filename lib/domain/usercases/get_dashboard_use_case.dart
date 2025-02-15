import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/core/usecase/usecase.dart';
import 'package:rikin_interview_14_02/domain/entities/response/LocationResponse/location_response.dart';
import 'package:rikin_interview_14_02/domain/repository/user_repository.dart';

class GetDashboardUseCase
    implements UseCase<ApiResponse<LocationResponse>, String?> {
  final UserRepository _userRepository;

  GetDashboardUseCase(this._userRepository);

  @override
  Future<ApiResponse<LocationResponse>> call({String? params}) {
    return _userRepository.getProductList();
  }
}
