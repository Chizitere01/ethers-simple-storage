// this is the code we are to use to encrypt our private keys and rpc_url
const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
  const encryptedJsonKey = await wallet.encrypt(
    process.env.PRIVATE_KEY_PASSWORD
  ); // The encrypt method expects two parameters: the password to encrypt the private key and an optional JSON-RPC derived key derivation function. However, in your code as copied from the course, you are passing the private key itself as the second parameter instead of the derivation function.To fix the issue, remove the second parameter.
  console.log(encryptedJsonKey);
  fs.writeFileSync("./.encryptedKey.json", encryptedJsonKey); // we are saving the encrypted key here in the file .encryptedKey.json. the file will be created as well.
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
