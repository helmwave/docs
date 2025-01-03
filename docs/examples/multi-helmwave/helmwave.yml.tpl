# {{- $files := file.ReadDir "helmwave" }}
# {{- $merger := print "merge:helmwave/" (join $files "|helmwave/") }}
# Merger is {{ $merger }}
# {{- defineDatasource "merged" $merger }}

{{ ds ("merged") | toYAML }}

project: multi-helmwave
