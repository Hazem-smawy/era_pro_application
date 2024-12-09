
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class AsyncRepositoryImp implements AsyncRepository{

        final AsyncRemoteDataSource remoteDataSource;
        AsyncRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    