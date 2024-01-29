import 'package:hestia/feature/auth/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:hestia/feature/auth/data/model/register_user_request_dto.dart';
import 'package:hestia/feature/auth/domain/repository/i_remote_repository.dart';

class RemoteRepoistoryAuth implements IRemoteRepositoryAuth {
  final IRemoteDataSourceAuth _remoteDataSource;
  const RemoteRepoistoryAuth({
    required IRemoteDataSourceAuth remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<void> registerNewUser({
    required String username,
    required String email,
    required String password,
    required bool isVerified,
    required bool isSuperUser,
  }) async =>
      await _remoteDataSource.registerNewUser(
        requestDto: RegisterUserRequestDto(
          email: email,
          username: username,
          isSuperUser: isSuperUser,
          isVerified: isVerified,
          password: password,
        ),
      );

  @override
  Future<(String, String)> authorize({
    required String username,
    required String password,
  }) async =>
      await _remoteDataSource.authenticate(username, password);

  @override
  Future<(String, String)> refresh() async => await _remoteDataSource.refresh();
}
