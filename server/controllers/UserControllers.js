const userdata = require('../models/UserProfile');
const client = require('../MongoDbConnection');
const registerUserProfile = async (req, res) => {
    if(!req.body) {
        return res.status(400).json({message: 'Invalid request'});
    }

    console.log(req.body)
    
    try {
        await client.connect();
        const db = client.db("DungeonRunnerGame");
        const doc = db.collection("UserProfile");

        const ressult = await doc.insertOne ({
            username: req.body.username,
            password: req.body.password,
            userBasedHP: req.body.userBasedHP,
            userBaseMP: req.body.userBaseMP,
            Wallet_Address: req.body.Wallet_Address,
        
            UserLevel: req.body.UserLevel,
            UserTotalExp: req.body.UserTotalExp,
            userDamage: req.body.userDamage,
            userArmor: req.body.userArmor,
            userBalance: req.body.userBalance,
            
        });
        console.log(res)
        return res.status(201).json({message: 'User created successfully'});
    } catch (error) {
        return res.status(500).json({message: 'Failed to create user'});
    }
   
   
}
const getUserProfile = async (req, res) => {
    if(!req.body.username && !req.body.password) {

        return res.status(400).json({message: 'Invalid request'});
    }
    console.log(req.body)
    try {
        await client.connect();
        const db = client.db("DungeonRunnerGame"); 
        const collection = db.collection("UserProfile");
        const doc  = await collection.findOne({username: req.body.username});
        if (!doc){
            return res.status(401).json({message: 'User not found'});
        }
        if(doc.password !== req.body.password){
           res.status(401).json({message: 'Wrong password and '});  
        }else{
            res.json(doc);
        }
       
    } catch (error) {
        return res.status(500).json({message: 'Failed to fetch user'});
    }
}   

const testApiCall = async(req,res) =>{
    console.log("is callablie")
}


module.exports = {  registerUserProfile,getUserProfile ,testApiCall};