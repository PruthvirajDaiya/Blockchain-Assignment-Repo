const crypto = require("crypto");

function findHash(prefix) {
  let input = 0;
  let inputStr, hash;
  while (true) {
    inputStr = input.toString();
    hash = crypto.createHash("sha256").update(inputStr).digest("hex");
    if (hash.startsWith(prefix)) {
      return { input, hash };
    }
    input++;
  }
}

const res = findHash("00000");
console.log(`Input: ${res.input}`);
console.log(`Hash: ${res.hash}`);

