{{- define "aardvark-conf" }}
[database]
connection_recycle_time=600

[reaper]
strategy=oldest
parallel_timeout=20
watched_aggregates={{ .Values.conf.watched_aggregates }}

[aardvark]
enable_notification_handling=False
enable_watermark_mode=True
watermark=80
periodic_interval=300

[placement]
auth_url={{ .Values.conf.keystone.auth_url }}
username={{ .Values.conf.keystone.username }}
project_name={{ .Values.conf.keystone.project_name }}
user_domain_name=Default
project_domain_name=Default
auth_type=password

[compute]
client_version=2.87
auth_url={{ .Values.conf.keystone.auth_url }}
username={{ .Values.conf.keystone.username }}
project_name={{ .Values.conf.keystone.project_name }}
user_domain_name=Default
project_domain_name=Default
auth_type=password

[identity]
auth_url={{ .Values.conf.keystone.auth_url }}
username={{ .Values.conf.keystone.username }}
project_name={{ .Values.conf.keystone.project_name }}
user_domain_name=Default
project_domain_name=Default
auth_type=password

{{- if .Values.conf.memcached_servers }}
[cache]
enabled = true
memcache_servers={{ join "," .Values.conf.memcached_servers }}
backend = dogpile.cache.memcached
{{- end }}

{{- end }}
