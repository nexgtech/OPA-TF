
## Evaluate OPA policy using cli
```bash
opa eval --data policy/example.rego --input policy/input.json 'data.policy.allow'
opa eval --format raw --data policy/example.rego 'data.policy.allow'
opa eval --format raw --data policy/example.rego --input policy/input.json 'data.policy.allow'
```
## Test the policy
```bash
opa test policy/
```

## run opa as service
```bash
opa run --server --config-file=config.yaml --set-file="keys.verifier.key=public_key.pem"
```

## How to setup bundle server
## How to sign the bundles


https://github.com/kenfdev/opa-decision-logs-example


```bash
$ docker-compose up -d
```

```bash
$ curl -XPOST -d '{ "input": {"user": { "username": "john", "roles":["developer"] }} }' http://localhost:8181/v1/data/policy/allow
```

