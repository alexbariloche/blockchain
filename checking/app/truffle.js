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
    from: "0xa8b544efee661f371babc44fda56add52dc58779", // use the account-id generated during the setup process
    gas: 20000000
  }
}

};
