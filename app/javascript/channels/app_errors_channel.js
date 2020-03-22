import consumer from "./consumer"

consumer.subscriptions.create("AppErrorsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const error_list =  document.getElementById('error_list');
    if(error_list != null){
      const tr = document.createElement('tr');
      tr.innerHTML = data.new_error
      error_list.prepend(tr)
    }
  }
});
