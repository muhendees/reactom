export default class CommentList extends React.Component {
    render() {
        console.log(this.props.comment, "LOOOL");
        var commentNodes = this.props.data.map(
            function(comment) {
                return  <Comment author={comment.author} key={comment.id} text={comment.text} />
            });
        return  <div className="commentList">
            {commentNodes}
        </div>;
    }
}
