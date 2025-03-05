const mongoose = require('mongoose');

const UserplayerData = new mongoose.Schema({
    username: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    userBasedHP: {
        type: Number,
        required: true
    },
    userBaseMP :{
        type: Number,
        required: true
    },
    Wallet_Address: {
        type: String,
        required: true
    },
    UserLevel: {
        type: Number,
        required: true
    },
    UserTotalExp: {
        type: Number,
        required: true
    },
    userDamage: {
        type: Number,
        required: true
    } ,
    userArmor: {
        type: Number,
        required: true
    },
    userBalance: {
        type: Number,
        required: true
    },
   
})
const userdata = mongoose.model('UserProfile', UserplayerData);

module.exports = userdata;