const express = require('express');
const app = express();

const userModel = require('./model/user');
const postModel = require('./model/post');
const cookieParser = require('cookie-parser');
const cors = require('cors');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
app.use(express.json());
app.use(cookieParser());
app.use(cors());

app.get('/', function (req, res) {
    res.send('done');
});

app.post('/create/user', async function(req, res){
    let {email, username, name, password, post} = req.body;

    if(!email || !username || !name || !password) return res.status(400).json({
        message: 'All Fields are Required'
    });

    try {
        let existingUser = await userModel.findOne({email})
        if (existingUser) return res.status(409).json({
            message: 'User Already Exist'
        });

        //encrypt the password using hash
        bcrypt.genSalt(10, function(err, salt){
            bcrypt.hash(password, salt, async function(err){
                let cratedUser = await userModel.create({
                    name,
                    username,
                    email,
                    password: hash,
                    post: ''
                });
                    //json web toke
                    let token = jwt.sign({email: email, id: cratedUser._id}, 'secret', {expiresIn: '1h'});
                    
                    //set cookie
                    res.cookie('token', token,{
                        httpOnly: true,
                        secure: false,
                        sameSite: 'lax',
                        maxAge: 3600000,
                        path: '/'
                    });
                    console.log('create user: ', cratedUser);
                    return res.status(200).json({
                        message: 'User Created Successfully'
                    })
                    
            });
        });
        
    } catch (error) {
        return res.status(500).json({
            message: 'Internal Server Error'
        })        
    }
});

app.post('/login', async function(req, res){
    let {email, password,} = req.body;

    if(!email || !password) return res.status(400).json({
        message: 'All Fields are Required'
    });
    try {
        let user = await userModel.findOne({email});
        if (!user) {return res.status(404).json({
            message: 'Invalid Email or Password'
        })}
        bcrypt.compare(password, user.password, function(err, result){
            if(result){

                let token = jwt.sign({email: user.email, id: user._id}, 'secret', {expiresIn: '1h'});
                res.cookie('token', token,{
                    httpOnly: true,
                    sameSite: 'lax',
                    maxAge: 3600000,
                    secure: false,
                    path: '/'

                });
                console.log('login successful', user);
                return res.status(200).json({
                    message: 'Successfully Login',
                    token: token
                });
            }else{
                return res.status(404).json({
                message: 'Invalid Email or Password'
                });
            }
        });

    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
});

app.get('/logout', function(req,res){
    try {
        res.cookie('token', '',{
            httpOnly: true,
                sameSite: 'lax',
                expires: new date(0),
                secure: false,
                path: '/'
        });
        return res.status(200).json({
                message: 'Successfully Log Out'
            });
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });

    }
});

app.post('/create/post', async function(req, res){
    let {data} = req.body;
    if(!data) return res.status(400).json({
        message: 'Field is Required'
    })
    try {
        let post = await postModel.create({
            data
        })
    } catch (error) {
        
    }

});

app.get('/profile', isLoggedIn, function(req,res){
    
});

function isLoggedIn(req, res, next){
    
    let token = req.cookies.token;
    if(!token) {
        console.log('you must be loggedin');
        return res.status(401).json({
        message: 'You Must be Logged In'})
    }
    try {
        let data = jwt.verify(req.cookies.token, 'secret');
        req.user = data;
        next();
    } catch (error) {
        return res.status(401).json({ 
            message: 'Invalid or expired token' });

    }

}

// app.use(function(err, req, res){
//     console.error('Unhandled error:', err);
// })

app.listen(3000);