{{/* Return list of hosts defined in ingresses */}}
{{- define "ingress.listHosts" -}}
  {{- $rootContext := .data -}}
  {{- $data := list -}}
  {{- $scheme := default "http" (regexFind "^[a-zA-Z][a-zA-Z0-9+.-]*" $rootContext.Values.global.siteUrl) -}}

  {{- $enabledIngresses := (include "ingress.getEnabled" (dict "rootContext" $rootContext ) | fromYaml ) -}}

  {{- range $id := keys $enabledIngresses -}}
    {{- $ingressObject := (include "ingress.getById" (dict "rootContext" $rootContext "id" $id) | fromYaml) -}}
    {{- range $ingressObject.hosts -}}
      {{- if $ingressObject.tls -}}
         {{- $data = (append $data (print "https://" .host)) -}}
      {{- else -}}
         {{- $data = (append $data (print "http://" .host)) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{- if $rootContext.Values.httpRoute.enabled -}}
    {{- range $rootContext.Values.httpRoute.hostnames -}}
      {{- $data = (append $data (printf "%s://%s" $scheme .)) -}}
    {{- end -}}
  {{- end -}}
  {{- join "," ($data |uniq) | quote -}}
{{- end -}}

{{/* Return list of hosts defined in ingresses for server_name */}}
{{- define "ingress.listServers" -}}
  {{- $rootContext := .data -}}
  {{- $data := list -}}

  {{- $enabledIngresses := (include "ingress.getEnabled" (dict "rootContext" $rootContext ) | fromYaml ) -}}

  {{- range $id := keys $enabledIngresses -}}
    {{- $ingressObject := (include "ingress.getById" (dict "rootContext" $rootContext "id" $id) | fromYaml) -}}
    {{- range $ingressObject.hosts -}}
      {{- $data = append $data .host -}}
    {{- end -}}
  {{- end -}}
  {{- if $rootContext.Values.httpRoute.enabled -}}
    {{- range $rootContext.Values.httpRoute.hostnames -}}
      {{- $data = append $data . -}}
    {{- end -}}
  {{- end -}}
  {{- join " " ($data |uniq) -}}
{{- end -}}
