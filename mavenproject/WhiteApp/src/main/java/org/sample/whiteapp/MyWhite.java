/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.sample.whiteapp;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author Administrator
 */
@ServerEndpoint(value="/whiteendpoint", encoders = {FigureEncoder.class}, decoders = {FigureDecoder.class})
public class MyWhite {
    private static Set<Session> peers = Collections.synchronizedSet(new HashSet<Session>());
    
    @OnClose
    public void onClose(Session peer) {
        peers.remove(peer);
    }

    @OnOpen
    public void onOpen(Session peer) {
        peers.add(peer);
    }
    
    @OnMessage
    public void broadcastFigure(Figure figure, Session session) throws IOException, EncodeException {
        System.out.println("broadcastFigure: " + figure);
        for (Session peer : peers) {
            if (!peer.equals(session)) {
                peer.getBasicRemote().sendObject(figure);
            }
        }
    }
    @OnMessage
public void broadcastSnapshot(ByteBuffer data, Session session) throws IOException {
    System.out.println("broadcastBinary: " + data);
    for (Session peer : peers) {
        if (!peer.equals(session)) {
            peer.getBasicRemote().sendBinary(data);
        }
    }
}
  
}
