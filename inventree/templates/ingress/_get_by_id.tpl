{{/*
Return an Ingress Object by its id.
*/}}
{{- define "ingress.getById" -}}
  {{- $rootContext := .rootContext -}}
  {{- $id := .id -}}

  {{- $enabledIngresses := (include "ingress.getEnabled" (dict "rootContext" $rootContext) | fromYaml ) }}

  {{- if (hasKey $enabledIngresses $id) -}}
    {{- get $enabledIngresses $id | toYaml -}}
  {{- end -}}
{{- end -}}
