const email = () => {
    return $('#email').val().trim();
}

const createRepo = (emial) => {
    let data = {
        email,
        private: true,
        auto_init: true,
        description: 'This is a auto push repository for Podo_Farm'
    };
    data = JSON.stringify(data);
}

var http = require("http")
var express = require("express")
var app = express()
app.use(express.static(public))
app.use(express.bodyParser())
app.use(app.router)


// @param {String} email;

async function searchEmail(email){
    console.log("async function works");
    
}
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