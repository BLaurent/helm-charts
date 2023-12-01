{{/* vim: set filetype=mustache: */}}

{{/*
Common labels
*/}}
{{- define "imaging-fabric.labels" -}}
helm.sh/chart: {{ .Chart.Name }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Parameterized template as function to decide custom image override should be used for containers or the default one
*/}}
{{- define "imaging-fabric.image" -}}
{{- $service := index . 0 -}}
{{- $root := index . 1 -}}
{{- with $root -}}
{{-   printf "%s" (default (printf "%s/%s" .Values.commonSettings.image.registryUrl $service.repository ) $service.imageOverride ) -}}
{{- end -}}
{{- end -}}

{{/*
Create the common user id to use
*/}}
{{- define "imaging-fabric.userId" -}}
{{-   printf "1500" -}}
{{- end -}}

{{/*
Create the common group id to use
*/}}
{{- define "imaging-fabric.groupId" -}}
{{-   printf "1500" -}}
{{- end -}}

{{/*
Parameterized template as function to generate securityContext
*/}}
{{- define "imaging-fabric.securityContext" -}}
{{- $name := (index . 0)  -}}
{{- $userId := dict "key" (include "imaging-fabric.userId" .) -}}
uid: {{ index $userId "key" }}
gid: {{ (include "imaging-fabric.groupId" .) }}
fsGroup: {{ (include "imaging-fabric.groupId" .) }}
{{- end -}}
