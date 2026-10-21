{{/*
Expand the name of the chart.
*/}}
{{- define "investment-advisor-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "investment-advisor-agent.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "investment-advisor-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Parent helpers use the dependency values without shadowing its helpers. */}}
{{- define "investment-advisor-agent.storageName" -}}
{{- index .Values "aws-compatible-storage" "fullnameOverride" -}}
{{- end }}

{{- define "investment-advisor-agent.storageSecret" -}}
{{- index .Values "aws-compatible-storage" "s3" "existingSecret" -}}
{{- end }}

{{- define "investment-advisor-agent.storageEndpoint" -}}
{{- printf "%s.%s.svc.cluster.local:7480" (include "investment-advisor-agent.storageName" .) .Release.Namespace -}}
{{- end }}
