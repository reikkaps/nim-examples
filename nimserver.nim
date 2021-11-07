import std/net

# some definitions
let port: int = 1965
let keyfile = "./mykey.pem"
let certfile = "./mycert.pem"

let socket = newSocket()
let ctx = newContext(keyfile=keyfile, certfile=certfile)

wrapSocket(ctx,socket)
socket.bindAddr(Port(port))
socket.listen()
echo "Server is listing at localhost:",port


var client: Socket
var address = ""
while true:
  socket.acceptAddr(client, address)
  echo "Client connected from ", address

socket.close()
