
# Usage

See main project at: https://github.com/svenstaro/dummyhttp  
Print help with: `docker run dersimn/dummyhttp --help`

```
docker run --rm --init -p 8080:8080 dersimn/dummyhttp
```

Test in a seperate window with

```
curl -H "X-MyHeader: FooBar" localhost:8080/foo?bar=baz
```

```
simon:dummyhttp $ docker run --rm --init -p 8080:8080 dummyhttp
dummyhttp v1.1.0 listening on http://0.0.0.0:8080
2025-39-10 18:39:17 192.168.65.1:35522 GET /foo?bar=baz HTTP/1.1
┌─Incoming request
│ GET /foo?bar=baz HTTP/1.1
│ Accept: */*
│ Host: localhost:8080
│ User-Agent: curl/8.7.1
│ X-Myheader: FooBar
┌─Outgoing response
│ HTTP/1.1 200 OK
│ Content-Type: text/plain; charset=utf-8
│ Date: Mon, 10 Mar 2025 18:39:17 +0000
```


# Build

```
docker build -t dummyhttp .
```

## GitHub Actions

1) Create personal access token with permissions:

- Fine-grained token:
    - Contents: read/write
    - Pull requests: read/write
    - (Basically the same that you specify in GitHub Actions YAML under `permissions:`.)
- Classic Token needs only scope `repo`

Save under `Settings > Secrets and Variables > Dependabot` or use 

    gh secret set PERSONAL_ACCESS_TOKEN --body '<TOKEN>' --app dependabot

2) Create Token to access Docker Hub, save under `Settings > Secrets and Variables > Actions` or use

    gh secret set DOCKERHUB_TOKEN --body '<TOKEN>'
