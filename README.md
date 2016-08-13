# Lazy Cert Management

## Config

Copy ```config.example.sh``` to ```config.sh```

>``` cp config.example.sh config.sh```

Edit ```config.sh```

## Usage

### newDomain

```./newDomain.sh <domain>```

> ```./newDomain.sh "www.example.com"```

### renewDomain

```./renewDomain.sh <domain>```

> ```./renewDomain.sh "www.example.com"```

### pushCert

unzip ```ssl_certificate.zip``` and place in ```./cert/``` folder

```./pushCert```

### updateAllDomain

Create CSR for all domain in ```./cert/```

```./updateAllDomain.sh```
