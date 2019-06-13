# Certificados para o Fabric

As chaves geradas para o fabric não podem ser RSA (<https://hyperledger-fabric.readthedocs.io/en/release-1.4/msp.html> - Topico "MSP setup on Peer & Ordeer side"). O padrão utilizado é o de curvas elípticas. Nas próximas sessões serão demonstrados como gerar tal material criptográfico.

## Geração de material criptográfico para ser assinado por pki própria

### Gerção da chave privada

Para a geração do material criptográfico, o seguinte script pode ser utilizado:

``` bash
#!/bin/bash

for folder in $(find . -maxdepth 1 -type d  | grep -vE '*\.$' | cut -d"/" -f 2)
do
    echo Generating crypto matherial for: $folder
    echo Generating private key
    openssl ecparam -genkey -name prime256v1 -out $folder/$folder.key
    echo Generating certificate request
    openssl req -new -sha256 -out $folder/$folder.csr -key $folder/$folder.key -config $folder/$folder.cnf
done
```

Para utilização do script acima, salvá-lo na raiz do diretório onde existem as pastas nas quais o material criptográfico será gerado.

## Geração de material criptográfico utilizando cryptogen

