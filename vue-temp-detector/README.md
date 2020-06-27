# Vue Temp Dector

## Instalacion

La aplicación está desarrollada en Vue y sirve como front web para el kit de herramientas de Temp Detector.

## Envoy Proxy

Build docker image

```cmd
sudo -E docker build -t envoy:v1 .
```

Run docker image

```cmd
sudo docker run  -p 10546:10546 --net=host  envoy:v1
```

## install dependencies

```cmd
npm install
```

## serve with hot reload at localhost:8080

```cmd
npm run dev
```

## build for production with minification

```cmd
npm run build
```

## build for production and view the bundle analyzer report

```cmd
npm run build --report
```
