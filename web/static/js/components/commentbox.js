import CommentForm from "./commentform"
import CommentList from "./commentlist"


export default class CommentBox extends React.Component {

    constructor() {
        super();
        this.state = { data: [] }

    }

    loadCommentsFromServer() {
        return $.ajax({
            url: this.props.url,
            dataType: 'json',
            cache: false,
            success: function(data) {
                this.setState({data: data});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    }

    handleCommentSubmit(comment) {
        var comments = this.state.data;
        console.log(comments, "Burda kommentler olmalidi")
        var newComments = comments.concat([comment]);
        this.setState({data: newComments});
        return $.ajax({
            url: this.props.url,
            dataType: 'json',
            type: 'POST',
            data: comment,
            success: function(data) {
                this.setState({data: data});
            }.bind(this),
            error: function(xhr, status, err) {
                this.setState({data: comments});
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    }

    componentDidMount() {
        this.loadCommentsFromServer();
        setInterval(this.loadCommentsFromServer, this.props.pollInterval);
    }

    render() {
        return  <div className="commentBox">
            <h1 Comments />,
            <CommentList data={this.state.data} />,
            <CommentForm onCommentSubmit={this.handleCommentSubmit} />
            </div>;
    }
}

