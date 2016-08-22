var User = React.createClass({
  getInitialState(){
    return {editable: false}
  },
  handleEdit() {
    if (this.state.editable){
      var name = this.refs.name.value;
      var email = this.refs.email.value;
      var id = this.props.user.id;
      var user = {id: id, name: name, email: email};
      this.props.handleUpdate(user);
    }
    this.setState({editable: !this.state.editable});
  },
  render() {
      var name = this.state.editable ? <input type='text' ref='name' defaultValue={this.props.user.name} /> : <h3>{this.props.user.name}</h3>
      var email = this.state.editable ? <input type='text' ref='email' defaultValue={this.props.user.email} /> : <p className='email' >{this.props.user.email}</p>
      return (
        <div className='user-box'>
          { name }
          { email }
          <button onClick={this.handleEdit}> {this.state.editable ? 'Submit' : 'Edit' }</button>
          <button onClick={this.props.handleDelete}> Delete </button>
        </div>
      )
  }
});
