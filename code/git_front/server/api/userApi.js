/* eslint-disable @typescript-eslint/no-var-requires */
let models = require('../db');
let express = require('express');
let router = express.Router();
let mysql = require('mysql');

let conn = mysql.createConnection(models.mysql);
conn.connect();

// let conn_info = mysql.createConnection(models.mysql_info);
// conn_info.connect();

let jsonWrite = function(res, ret) {
    if (typeof ret === 'undefined') {
        res.json({
            code: '1',
            msg: '操作失败'
        });
    } else {
        res.json(ret);
    }
};



router.post('/getTables', (req, res) => {
    const table_name = req.body.table_name._value;
    console.log(table_name);

    let sql = `select * from ${table_name};`;
    conn.query(sql, (err, result) => {
        if (err) {
            console.log(table_name)
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result)
        }
    })
})

module.exports = router;