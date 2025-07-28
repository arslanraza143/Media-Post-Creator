const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/postdb')
.then(()=>{
    console.log('✅ Mongo Connected Successfully');
})
.catch((err)=>{
    console.console.log(err); 
})

const userSchema = mongoose.Schema({
    name: String,
    username: {
        type: String,
    },
    email: String,
    password: String,
    post: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'post'
    }]
});

module.exports = mongoose.model('user', userSchema);