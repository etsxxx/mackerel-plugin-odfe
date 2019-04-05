mackerel-plugin-odfe
=====================

Open Distro for Elasticsearch (ODFE) custom metrics plugin for mackerel.io agent.

This is a porting from official plugin [mackerel-plugin-elasticsearch](https://github.com/mackerelio/mackerel-agent-plugins/tree/441cf84ba361910eddd26fe187bd6e5c3a8261e6/mackerel-plugin-elasticsearch). 

## Synopsis

```shell
mackerel-plugin-odfe [-scheme=<'http'|'https'>] [-host=<host>] [-port=<manage_port>] [-tempfile=<tempfile>] [-metric-key-prefix=<prefix>] [-metric-label-prefix=<label-prefix>] [-user=<username> -password=<password>] [-secure]
```

NOTE:

* This plugin outputs metrics with `elasticsearch.` prefix for compatibility to official. You can change it by `-metric-key-prefix` option. 
* This plugin does NOT check TLS certificate in default. (Because most people will use this plugin to Elasticsearch running on localhost, the certificate has no meanings.) If you need check, use `-secure` option.
* You can use `ES_USER` environment variable instead of `-user` option.
* You can use `ES_PASSWORD` environment variable instead of `-password` option.


## Example of mackerel-agent.conf

With plain http:

```
[plugin.metrics.elasticsearch]
command = "/path/to/mackerel-plugin-odfe -port=6666"
```

With https:

```
[plugin.metrics.elasticsearch]
command = "/path/to/mackerel-plugin-odfe -scheme=https"
```

With basic auth:

```
[plugin.metrics.elasticsearch]
command = "/path/to/mackerel-plugin-odfe -scheme=https"
env = { ES_USER = "USERNAME", ES_PASSWORD = "PASSWORD" }
```
