# Apache httpd Content-Type Whitespace '=' Parameter PoC

This repository demonstrates an issue in Apache httpd where media type parameters
in HTTP headers incorrectly accept whitespace around the '=' character,
which violates RFC 7231 Section 3.1.1.1.

## Build and Run

```bash
docker build -t apache-httpd-ctype-poc .
docker run -p 80:80 apache-httpd-ctype-poc
