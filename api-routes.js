// api-routes.js
const express = require("express");
const jsonServer = require("json-server");

const router = express.Router();
const server = jsonServer.create();
const middlewares = jsonServer.defaults();
const customerRouter = jsonServer.router("./db/customer.json");
const manualCostRouter = jsonServer.router("./db/manual-cost.json");

// router.use("/", customerRouter);
router.use("/manual-cost", manualCostRouter);
router.use("/", customerRouter);

module.exports = router;
