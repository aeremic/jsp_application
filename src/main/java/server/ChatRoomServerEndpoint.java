package server;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatEndpoint")
public class ChatRoomServerEndpoint {
	static Set<Session> chatRoomUsers = Collections.synchronizedSet(new HashSet<>());

	@OnOpen
	public void handleOpen(Session userSession) {
		chatRoomUsers.add(userSession);
	}

	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		String username = (String) userSession.getUserProperties().get("username");
		if (username == null) {
			userSession.getUserProperties().put("username", message);
			userSession.getBasicRemote().sendText(buildJson("Server", "Konektovani ste kao " + message));
		} else {
			Iterator<Session> iterator = chatRoomUsers.iterator();
			while (iterator.hasNext())
				iterator.next().getBasicRemote().sendText(buildJson(username, message));
		}
	}

	@OnClose
	public void handleClose(Session userSession) {
		chatRoomUsers.remove(userSession);
	}

	private String buildJson(String username, String message) {
		JsonObject jsonObject = Json.createObjectBuilder().add("message", username + ": " + message).build();
		StringWriter stringWriter = new StringWriter();
		
		try (JsonWriter jsonWriter = Json.createWriter(stringWriter)) {
			jsonWriter.write(jsonObject);
		}
		
		return stringWriter.toString();
	}
}
