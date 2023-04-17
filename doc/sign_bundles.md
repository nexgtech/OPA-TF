

## Signing the Open Policy Agent (OPA) bundles 
Signing the OPA bundles is a security best practice that helps ensure the integrity and authenticity of the bundled policies and data. 

1. Generate a signing key pair:
    ```bash
    $ openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048
    $ openssl rsa -pubout -in private_key.pem -out public_key.pem
    ```
    > Note: The private key for sign the bundles, and the public key for verify the signature.

2. Create .signatures.json
    ```bash
    $ opa sign --signing-key opa/private_key.pem --bundle policy/
    $ mv .signatures.json policy/
    ```

3. Sign the bundles Using the private key:
    ```bash
    $ opa build --verification-key opa/public_key.pem --signing-key opa/private_key.pem --bundle policy
    $ mv bundle.tar.gz bundle
    ```

4. OPA configuration files:
    ```bash
    $ vi config.yaml
    services:
      nginx:
        url: http://localhost:5050
    bundles:
      policy:
        service: nginx
        resource: bundle.tar.gz
        signing:
        keyid: verifier
    keys:
      verifier:
        key: changeme
    ```


5. Verify the signature of a signed bundle using `run` command. make sure a signed bundle that include a file named `.signatures.json`: 
    ```bash
    $ opa run --server \
            --config-file=config.yaml \
            --set-file="keys.verifier.key=public_key.pem"
    ```
    > Note: you can see "Bundle loaded and activated successfully." in the logs.

* Update bundle server configuration: 
