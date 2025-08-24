<!-- <picture>
  <source
    width="100%"
    srcset="./docs/content/public/banner-dark-1280x640.avif"
    media="(prefers-color-scheme: dark)"
  />
  <source
    width="100%"
    srcset="./docs/content/public/banner-light-1280x640.avif"
    media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)"
  />
  <img width="250" src="./docs/content/public/banner-light-1280x640.avif" />
</picture> -->

<h1 align="center">Nginx mTLS with Automatic Key Rotation</h1>

<p align="center">
  Organizations should protect their website, but the conventional PKI process workflow takes a long time, which motivates organizations to create certificates which do not expire for a year or more.
  This repository aims to be a production-ready solution that uses hashicorp vault as a self-hosted Key Management System (KMS) to create X.509 certificates for usage in Mutual Transport Layer Security (MTLS) or other arbitrary PKI encryption. 
  You can use this solution to create web server certificates, but if users do not import the CA chains, browsers do complain about the self-signed certificates.
</p>

<p align="center">
  <img alt="GitHub License" src="https://img.shields.io/github/license/ImreAngelo/nginx-mtls-rotation">
  <!-- ![example workflow](https://github.com/github/docs/actions/workflows/main.yml/badge.svg) -->
</p>

> [!WARNING]
> **Attention:** Make sure [ingress-nginx](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start) is installed, either via Helm or using the command below.

```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.13.1/deploy/static/provider/cloud/deploy.yaml`
```

Check the `services/networking/bootstrap/README.md` file for information about setting up TLS. 
Then run `make dev` to create a local testing environment.

> [!NOTE]
>
> In production, the self-signed certificate(s) can be signed by let's encrypt to provide modern encryption that is trusted by default.
>
> **TODO:** Automate this process

> [!TIP]
> You can reset the cluster at any point by running `make clean`


## Guide

> For detailed instructions to develop this project, follow the [CONTRIBUTING.md](./.github/CONTRIBUTING.md)

> [!NOTE]
> By default, `make dev` will start the development server for the Stage Web (browser version), if you would
> like to try developing the desktop version, please make sure you read [CONTRIBUTING.md](./.github/CONTRIBUTING.md)
> to setup the environment correctly.

```shell
make
make k8s-deploy
```


## Current progress

<!-- <img src="./docs/content/public/readme-image-pc-preview.avif"> -->

Todo list

- [x] A
  - [x] B
- [ ] C 
