# Bootstrap TLS Certificate
Ingress cannot serve HTTPS without a valid certificate.
The idea of this project is to get that certificate from the vault, but for now I will just create one for testing.

```
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout tls.key \
  -out tls.crt \
  -subj "/CN=localhost/O=localhost"
```

```
kubectl create secret tls nginx-cache-tls \
  --cert=tls.crt \
  --key=tls.key
```