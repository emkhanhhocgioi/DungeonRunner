const express = require('express');
const app = express();
const port = 3000;
const router = require('./Routes/UserRoute');
const client = require('./MongoDbConnection');



app.use(express.json());
app.use('/api/', router);

app.listen(port, () => {
    console.log(`Server đang chạy tại http://localhost:${port}`);
    if (client != null ){
        console.log("Kết nối tới MongoDB thành công!");
    }
    else {
        console.log("Kết nối tới MongoDB thất bại!");
    }
});