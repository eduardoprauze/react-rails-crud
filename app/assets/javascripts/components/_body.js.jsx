var Body = React.createClass({
  getInitialState(){
    return { users: [] }
  },
  componentDidMount(){
    $.getJSON('/api/v1/users', (response) => { this.setState({ users: response }) });
  },
  handleSubmit(user){
    var newState = this.state.users.concat(user);
    this.setState({users: newState});
  },
  handleDelete(id){
    var url = '/api/v1/users/' + id;
    $.ajax({
      url: url,
      type: 'DELETE',
      success: () => {
        this.removeUser(id)
      }
    });
  },
  removeUser(id){
    var newUsers = this.state.users.filter((user) => {
      return user.id != id;
     });
     this.setState({users: newUsers});
  },
  handleUpdate(user){
    var url = '/api/v1/users/' + user.id;
    $.ajax({
      url: url,
      type: 'PUT',
      data: {user: user},
      success: () => {
        this.updateUsers(user);
      }
    });
  },
  updateUsers(user){
    var users = []
    this.state.users.forEach(function(loopuser, index){
      loopuser.id == user.id ? users.push(user) : users.push(loopuser);
    });

    this.setState({ users: users });
  },
 render() {
  return (
    <div>
      <NewUser handleSubmit={this.handleSubmit} />
      <AllUsers  users={this.state.users} handleDelete={this.handleDelete} onUpdate={this.handleUpdate}/>
    </div>
  )
 }
});
