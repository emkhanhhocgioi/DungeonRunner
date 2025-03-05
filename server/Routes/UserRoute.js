const express = require('express');
const router = express.Router();
const {getUserProfile,registerUserProfile, testApiCall }  = require('../controllers/UserControllers');



router.post('/register/profile', registerUserProfile )
router.post('/auth/login', getUserProfile ) 
router.get('/test', testApiCall )


module.exports = router;