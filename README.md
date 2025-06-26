# Apache httpd Content-Type Whitespace '=' Parameter PoC

This repository demonstrates an issue in Apache httpd where media type parameters
in HTTP headers incorrectly accept whitespace around the '=' character,
which violates RFC 7231 Section 3.1.1.1.

## Build and Run

```bash
docker build -t apache-httpd-dev .
docker run -p 8080:80 apache-httpd-dev
```

## Test
Run the provided test script to observe behavior:

```bash
bash test.sh
```
You will see that Apache httpd accepts Content-Type: text/html; charset = utf-8,
which is not RFC-compliant.

