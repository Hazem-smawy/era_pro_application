
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class SandRepositoryImp implements SandRepository{

        final SandRemoteDataSource remoteDataSource;
        SandRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    