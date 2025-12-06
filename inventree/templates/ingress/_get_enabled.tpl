{{/*
Return enabled Ingress objects
*/}}
{{- define "ingress.getEnabled" -}}
  {{- $rootContext := .rootContext }}
  {{- $enabledIngress := dict -}}

  {{- range $name, $ingress := $rootContext.Values.ingress -}}
    {{- if kindIs "map" $ingress -}}
      {{- /* Enable by default, but allow override */ -}}
      {{- $ingressEnabled := true -}}
      {{- if hasKey $ingress "enabled" -}}
        {{- $ingressEnabled = $ingress.enabled -}}
      {{- end -}}

      {{- if $ingressEnabled -}}
        {{- $_ := set $enabledIngress $name . -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- range $identifier, $objectValues := $enabledIngress -}}
    {{- $object := include "lib.valuesToObject" (dict "rootContext" $rootContext "id" $identifier "values" $objectValues "itemCount" (len $enabledIngress)) | fromYaml -}}
    {{- $_ := set $enabledIngress $identifier $object -}}
  {{- end -}}
  {{- $enabledIngress | toYaml -}}
{{- end -}}
