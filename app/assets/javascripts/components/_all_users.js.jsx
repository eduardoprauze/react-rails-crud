var AllUsers = React.createClass({
  handleDelete(id) {
    this.props.handleDelete(id);
  },
  onUpdate(user){
    this.props.onUpdate(user);
  },
  render() {
    var users = this.props.users.map((user) => {
      return (
        <div key={user.id} className='box-user'>
          <User user={user} handleDelete={this.handleDelete.bind(this, user.id)} handleEdit={this.handleEdit} handleUpdate={this.onUpdate} />
        </div>
      )
    });
    return (
      <div>
          { users }
      </div>
    )
  }
});
