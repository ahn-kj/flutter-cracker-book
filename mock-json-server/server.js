const express = require("express");
const apiRoutes = require("./api-routes");

const app = express();
app.use("/cracker-service", apiRoutes);

app.listen(4004, function () {
  console.log("JSON Server is running");
});
