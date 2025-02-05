const os = require("os");
const express = require("express")
const hostname = os.hostname();

const app = express()

app.get("/", (req,res) => {
	res.send("<h1>You are connected to " + hostname + "</h1>");
})
app.listen(5050,() => {
    console.log("Listening...")
})