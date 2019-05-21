module.exports = {

rpc: {
  host:"localhost",
  port:8543
},

networks: {
  development: {
    host: "localhost", //our network is running on localhost
    port: 8543, // port where your blockchain is running
    network_id: "*",
    from: "0xe7f0605861d0de8100675bbeb5bf506c07935693", // use the account-id generated during the setup process
    gas: 20000000
  }
}

};
