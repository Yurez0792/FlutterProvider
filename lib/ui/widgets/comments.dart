import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/viewmodels/comments_model.dart';
import 'package:provider_architecture/ui/base_view.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);
  Function onTap = () {

  };

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
        onModelReady: (model) => model.fetchComments(postId),
        builder: (context, model, child) => model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView(
                children: model.comments
                    .map((comment) => CommentItem(comment, onTap))
                    .toList(),
              )));
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  final Function onTap;

  const CommentItem(this.comment, this.onTap);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.redAccent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                comment.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              UIHelper.verticalSpaceSmall(),
              Text(comment.body),
            ],
          ),
        )
    );
  }
}
