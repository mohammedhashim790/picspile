import 'package:picspile/Bloc/Models/Story.dart';
import 'package:picspile/Services/StoryService/IStoryService.dart';



class StoryService implements IStoryService{
  @override
  Future<Story> createItem({required Story item}) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<Story> getItem({required String id}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<Story>> listAll() {
    // TODO: implement listAll
    throw UnimplementedError();
  }

}