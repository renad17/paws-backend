import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../middlewares/check_token_middleware.dart';
import '../../responses/post_responses/create_post_response.dart';
import '../../responses/post_responses/delete_post_response.dart';
import '../../responses/post_responses/read_all_posts_response.dart';
import '../../responses/post_responses/read_post_response.dart';
import '../../responses/post_responses/share_post_response.dart';
import 'favorites_router.dart';

class PostRouter {
  Handler get handler {
    final router = Router()
      ..post("/create", createPostHandler)
      ..get("/read_all", readAllPostsHandler)
      ..get("/read/<post_id>", readPostHandler)
      ..delete('/delete/<post_id>', deletePostHandler)
      ..get("/share/<post_id>", sharePostHandler)
      ..mount("/favorites", FavoritesRouter().handler);
    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
