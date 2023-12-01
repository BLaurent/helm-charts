# simple-web-api

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.16.0](https://img.shields.io/badge/AppVersion-v1.16.0-informational?style=flat-square)

An Helm chart to test deployment and various concept in rust

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | nats | 7.9.x |
| oci://registry-1.docker.io/blaurent | echo-web-api | 0.2.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonSettings.annotations.version | string | `"1.16.0"` | add version as annotation |
| commonSettings.image.pullPolicy | string | `"Always"` | default container pull policy |
| commonSettings.image.registryUrl | string | `"docker.io"` | default registry to use |
| commonSettings.image.repository | string | `"blaurent"` | name of the repository to use |
| commonSettings.ingress | bool | `true` | control whether we want an ingress to be created |
| commonSettings.podLabels | object | `{}` |  |
| echo.enabled | bool | `true` | disable echo installation |
| nats.enabled | bool | `true` | disable nats installation |
| simpleWebApi.NB_WORKERS | int | `2` | set the env variable NB_WORKERS to 2, this limit the number of logical cpus used by the service |
| simpleWebApi.image.repository | string | `"blaurent/simple-web-api"` | default repository |
| simpleWebApi.image.tag | string | `"v1.16.0"` | tag of the container |
| simpleWebApi.replicaCount | int | `2` | number of replicas we want between (1-10) are valid values |
| simpleWebApi.resources.limits.cpu | string | `"200m"` | 20% of 1 cpu |
| simpleWebApi.resources.limits.memory | string | `"128Mi"` | 128 mebibytes |
| simpleWebApi.resources.requests.cpu | string | `"100m"` | 10% of 1 cpu |
| simpleWebApi.resources.requests.memory | string | `"64Mi"` | 64 mebibytes |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)