const { spawn } = require("child_process");

console.log(`Starting audio extractor on port ${process.env.APP_PORT || 3001}`);
const audioApp = spawn("node", ["/app/index.js"], {
  stdio: "inherit",
  env: process.env
});

console.log(`Starting n8n on port ${process.env.PORT || 5678}`);
const n8n = spawn("n8n", ["start"], {
  stdio: "inherit",
  env: process.env
});

audioApp.on("exit", (code) => {
  console.error(`Audio extractor exited with code ${code}`);
  process.exit(code || 1);
});

n8n.on("exit", (code) => {
  console.error(`n8n exited with code ${code}`);
  process.exit(code || 1);
});
