// api-routes.js
const express = require("express");
const jsonServer = require("json-server");

const router = express.Router();
const server = jsonServer.create();
const middlewares = jsonServer.defaults({ noCors: true });
const dbRouter = jsonServer.router("./db/db.json");
server.use(middlewares);
router.use("/api", dbRouter);

module.exports = router;
