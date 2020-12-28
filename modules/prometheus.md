# prometheus

EMQ X Prometheus Agent 支持将数据推送至 Pushgateway 中，然后再由 Promethues Server 拉取进行存储。

## 创建模块

打开 [EMQ X Dashboard](http://127.0.0.1:18083/#/modules)，点击左侧的 “模块” 选项卡，选择添加：

选择 EMQ X Prometheus Agent

配置相关参数

点击添加后，模块添加完成

### Grafana 数据模板

`emqx_prometheus` 插件提供了 Grafana 的 Dashboard 的模板文件。这些模板包含了所有 EMQ X 监控数据的展示。用户可直接导入到 Grafana 中，进行显示 EMQ X 的监控状态的图标。

模板文件位于：[emqx\_prometheus/grafana\_template](https://github.com/emqx/emqx-prometheus/tree/master/grafana_template)。

