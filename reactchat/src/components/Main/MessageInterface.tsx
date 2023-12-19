import { useState } from "react";
import { useParams } from "react-router-dom";
import useWebSocket from "react-use-websocket";
import useCrud from "../../hooks/useCrud";
import { Server } from "../../@types/server.d";
import { Box, Typography } from "@mui/material";

interface ServerChannelProps{
  data:Server[];
}

interface Message {
  sender: string;
  content: string;
  timestamp: string;
}

const messageInterface = (props: ServerChannelProps) => {
  const { data } = props;
  const [newMessage, setNewMessage] = useState<Message[]>([]);
  const [message, setMessage] = useState("");
  const { serverId, channelId } = useParams();
  const server_name = data?.[0]?.name ?? "Server";
  const { fetchData } = useCrud<Server>(
    [],
    `/messages/?channel_id=${channelId}`
  );

  const socketUrl = channelId
    ? `ws://127.0.0.1:8000/${serverId}/${channelId}`
    : null;

  const { sendJsonMessage } = useWebSocket(socketUrl, {
    onOpen: async () => {
      try {
        const data = await fetchData();
        setNewMessage([]);
        setNewMessage(Array.isArray(data) ? data : []);
        console.log("Connected!!!");
      } catch (error) {
        console.log(error);
      }
    },
    onClose: () => {
      console.log("Closed!");
    },
    onError: () => {
      console.log("Error!");
    },
    onMessage: (msg) => {
      const data = JSON.parse(msg.data);
      setNewMessage((prev_msg) => [...prev_msg, data.new_message]);
    },
  });

  return ( <>{ channelId == undefined ? <
    Box 
    sx={{ 
      overflow: "hidden", 
      p:{ xs: 0}, 
      height: `calc(80vh)`, 
      display:"flex", 
      justifyContent:"center",
      alignItems: "center",
    }}
    >
      <Box sx={{ textAlign: "center" }}>
        <Typography 
          variant="h4" 
          fontWeight={700} 
          letterSpacing={"-0.5px"} 
          sx={{px:5,maxWidth:"600px"}}
          >
            Weclome to { server_name }
          </Typography>
          <Typography>
            {data?.[0]?.description ?? "This is our home"}
          </Typography>
        </Box>
    </Box> 
    : <>
      <div>
        {newMessage.map((msg:Message,index:number)=>{
          return(
            <div key={index}>
              <p>{msg.sender}</p>
              <p>{msg.content}</p>
            </div>
          );
        })}
      </div>
    </> }</>
  );
};
export default messageInterface;