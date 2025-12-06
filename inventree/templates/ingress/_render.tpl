{{/*
Render Ingress object
*/}}
{{- define "ingress.renderObject" -}}
  {{- $rootContext := .rootContext -}}
  {{- $ingressObject := .object -}}
  {{- $labels := merge
    (include "inventree.labels" $rootContext | fromYaml)
    ($ingressObject.labels | default dict)
  -}}
  {{- $annotations := merge
    ($ingressObject.annotations | default dict)
  -}}
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ $ingressObject.name }}
  {{- with $labels }}
  labels:
    {{- range $key, $value := . }}
      {{- printf "%s: %s" $key (tpl $value $rootContext | toYaml ) | nindent 4 }}
    {{- end }}
  {{- end }}
  {{- with $annotations }}
  annotations:
    {{- range $key, $value := . }}
      {{- printf "%s: %s" $key (tpl $value $rootContext | toYaml ) | nindent 4 }}
    {{- end }}
  {{- end }}
spec:
  {{- if $ingressObject.className }}
  ingressClassName: {{ $ingressObject.className }}
  {{- end }}
  {{- if $ingressObject.tls }}
  tls:
    {{- range $ingressObject.tls }}
    - hosts:
        {{- range .hosts }}
        - {{ tpl . $rootContext | quote }}
        {{- end }}
      {{- $secretName := tpl (default "" .secretName) $rootContext }}
      {{- if $secretName }}
      secretName: {{ $secretName | quote}}
      {{- end }}
    {{- end }}
  {{- end }}
  rules:
  {{- range $ingressObject.hosts }}
    - host: {{ tpl .host $rootContext | quote }}
      http:
        paths:
          {{- range .paths }}
          - path: {{ tpl .path $rootContext | quote }}
            pathType: {{ default "Prefix" .pathType }}
            backend:
              service:
                name: {{ include "inventree.fullname" $rootContext }}
                port:
                  number: 80
          {{- end }}
  {{- end }}
{{- end }}

