var NewUser = React.createClass({

  handleClick() {
    var name = this.refs.name.value;
    var email = this.refs.email.value;
    $.ajax({
      url: '/api/v1/users',
      type: 'POST',
      data: { user: { name: name, email: email } },
      success: (user) => {
        this.props.handleSubmit(user);
        this.refs.name.value = ''
        this.refs.email.value = ''
      }
    });
  },
  render() {
    return (
      <div>
        <input type='text' ref='name' placeholder='Name' />
        <input type='text' ref='email' placeholder='Email' />
        <button onClick={this.handleClick}> Submit </button>
      </div>
    )
  }
});
