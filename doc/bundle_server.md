## Open Policy Agent (OPA) Bundle Server
The Bundle Server allows you to package multiple OPA policies and data into a single bundle, which can be easily distributed and served by the HTTP server.

It's a lightweight HTTP server that serves the bundled policies and data over HTTP. This makes it easy to distribute policies to other services 

It supports dynamic updates of policies and data without requiring a restart of the server

## Setting up the Open Policy Agent (OPA) Bundle Server
* Once you have have the OPA policies and data, you can bundle them into a single package using the `opa bundle` command-line tool provided by OPA. 
* Start the OPA Bundle Server by running the `opa bundle serve` command. This will start the Bundle Server and make the bundled package available over HTTP
* Configure authentication: 
* Once the bundle server is running, you can access the bundled policies and data using HTTP requests to the server's endpoint.
