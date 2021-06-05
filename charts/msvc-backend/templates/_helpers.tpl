{{/*
Selector labels
*/}}
{{- define "msvc-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Chart name and version as used by the chart label
*/}}
{{- define "msvc-backend.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "msvc-backend.labels" -}}
helm.sh/chart: {{ include "msvc-backend.chart" . }}
{{ include "msvc-backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Names of backend tier components
*/}}
{{- define "msvc-backend.defaultName" -}}
{{- printf "msvc-backend-%s" .Release.Name -}}
{{- end -}}

{{- define "msvc-backend.serviceaccount.name" -}}
{{- printf "msvc-backend-serviceaccount-%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "msvc-backend.deployment.name" -}}
{{- default (include "msvc-backend.defaultName" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "msvc-backend.container.name" -}}
{{- default (include "msvc-backend.defaultName" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "msvc-backend.service.name" -}}
{{- default (include "msvc-backend.defaultName" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}