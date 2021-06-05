{{/*
Selector labels
*/}}
{{- define "msvc-gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Chart name and version as used by the chart label
*/}}
{{- define "msvc-gateway.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "msvc-gateway.labels" -}}
helm.sh/chart: {{ include "msvc-gateway.chart" . }}
{{ include "msvc-gateway.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Names of backend tier components
*/}}
{{- define "msvc-gateway.defaultName" -}}
{{- printf "msvc-gateway-%s" .Release.Name -}}
{{- end -}}

{{- define "msvc-gateway.serviceaccount.name" -}}
{{- printf "msvc-gateway-serviceaccount-%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "msvc-gateway.deployment.name" -}}
{{- default (include "msvc-backend.defaultName" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "msvc-gateway.container.name" -}}
{{- default (include "msvc-backend.defaultName" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "msvc-gateway.service.name" -}}
{{- default (include "msvc-backend.defaultName" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}