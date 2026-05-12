global:

route:
  receiver: github-remediation

  group_by: ['alertname', 'instance']

  group_wait: 10s
  group_interval: 10s
  repeat_interval: 1h

receivers:

- name: github-remediation
  webhook_configs:
  - url: "http://${TARGET_IP}:5000/alert"
