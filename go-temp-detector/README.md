# Go Temp Dector

## Instalacion

La aplicación está desarrollada en GO y sirve como backend para el kit de herramientas de Temp Detector.

```golang
export GO111MODULE=on
go mod download
```

## Docker

Para probar la aplicación en un entorno igual al de producción, tenemos que tener instalado Docker.

```cmd
Abrimos la consola, nos paramos sobre el directorio que clonamos.
docker-compose up
```

Y vamos a tener un servidor productivo, corrieno en nuestro localhost.

## Compilacion

La mayoría de los servidores están centOS, si se compila desde Windows hay que hacer lo siguiente

```golang
GOOS=linux GOARCH=amd64 go build
```

## Documentación GO

Para acceder la documentación del proyecto debemos montar el servicio **godoc** sobre un puerto **N** de localhost, por ejemplo el puerto *:6060*

Primero se debe correr el comando:

```golang
godoc -http=:6060 -v
```
