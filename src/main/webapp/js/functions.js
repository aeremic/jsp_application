
var websocket = new WebSocket("ws://localhost:8080/MobileShop/chatEndpoint");

websocket.onopen = function sendInitialMessage(){
	websocket.send(document.getElementById("firstlast").value);
}

websocket.onmessage = function processMessage(message){
	var jsonData = JSON.parse(message.data);	
	if(jsonData.message != null) messagesTextArea.value += jsonData.message + "\n";
}
	
function sendMessage(){
	websocket.send(messageText.value);
	messageText.value = "";
}

function closeSocket(){
	websocket.close();
}