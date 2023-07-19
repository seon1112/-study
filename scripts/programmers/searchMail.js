var http = require("http")
var express = require("express")
var app = express()
app.use(express.static(public))
app.use(express.bodyParser())
app.use(app.router)

app.post("/searchEmail", function(req,res){
    console.log("start");
    try {
        var email = req.param("email");
        console.log(email);
        res.send({
            message: "이메일 검색",
            data: email
        })
    } catch (e) {
        console.log(e);
    }
})

app.get("/searchEmail", function(req, res){
    res.send(email);
    console.log(email);
})