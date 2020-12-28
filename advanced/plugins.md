---
date: '2020-02-18T17:15:26.000Z'
author: hjianbo
keywords: null
description: null
category: null
ref: null
---

# plugins

EMQ X 发行包中，包含了大量的官方插件，提供了一些基础的、或各类扩展的功能。

它们依赖于 [emqx](https://github.com/emqx/emqx) 的代码 API 或者 [钩子](hooks.md) 进行实现其特殊的功能。

然后通过打包编译工具 [emqx-rel](https://github.com/emqx/emqx-rel) 将其与 [emqx](https:://github.com/emqx/emqx) 核心项目一起编译并打包至一个可运行的软件包中。

## 插件列表

目前 EMQ X 发行包提供的插件包括：

| 插件 | 配置文件 | 说明 |
| :--- | :--- | :--- |
| [emqx\_dashboard](https://github.com/emqx/emqx-dashboard) | etc/plugins/emqx\_dashbord.conf | Web 控制台插件 \(默认加载\) |
| [emqx\_management](https://github.com/emqx/emqx-management) | etc/plugins/emqx\_management.conf | HTTP API 与 CLI 管理插件 |
| [emqx\_auth\_clientid](https://github.com/emqx/emqx-auth-clientid) | etc/plugins/emqx\_auth\_clientid.conf | ClientId 认证插件 |
| [emqx\_auth\_username](https://github.com/emqx/emqx-auth-username) | etc/plugins/emqx\_auth\_username.conf | 用户名、密码认证插件 |
| [emqx\_auth\_jwt](https://github.com/emqx/emqx-auth-jwt) | etc/plugins/emqx\_auth\_jwt.conf | JWT 认证 / 访问控制 |
| [emqx\_auth\_ldap](https://github.com/emqx/emqx-auth-ldap) | etc/plugins/emqx\_auth\_ldap.conf | LDAP 认证 / 访问控制 |
| [emqx\_auth\_http](https://github.com/emqx/emqx-auth-http) | etc/plugins/emqx\_auth\_http.conf | HTTP 认证 / 访问控制 |
| [emqx\_auth\_mongo](https://github.com/emqx/emqx-auth-mongo) | etc/plugins/emqx\_auth\_mongo.conf | MongoDB 认证 / 访问控制 |
| [emqx\_auth\_mysql](https://github.com/emqx/emqx-auth-mysql) | etc/plugins/emqx\_auth\_mysql.conf | MySQL 认证 / 访问控制 |
| [emqx\_auth\_pgsql](https://github.com/emqx/emqx-auth-pgsql) | etc/plugins/emqx\_auth\_pgsql.conf | PostgreSQL 认证 / 访问控制 |
| [emqx\_auth\_redis](https://github.com/emqx/emqx-auth-redis) | etc/plugins/emqx\_auth\_redis.conf | Redis 认证 / 访问控制 |
| [emqx\_psk\_file](https://github.com/emqx/emqx-psk-file) | etc/plugins/emqx\_psk\_file.conf | PSK 支持 |
| [emqx\_web\_hook](https://github.com/emqx/emqx-web-hook) | etc/plugins/emqx\_web\_hook.conf | Web Hook 插件 |
| [emqx\_lua\_hook](https://github.com/emqx/emqx-lua-hook) | etc/plugins/emqx\_lua\_hook.conf | Lua Hook 插件 |
| [emqx\_retainer](https://github.com/emqx/emqx-retainer) | etc/plugins/emqx\_retainer.conf | Retain 消息存储模块 |
| [emqx\_rule\_engine](https://github.com/emqx/emqx-rule-engine) | etc/plugins/emqx\_rule\_engine.conf | 规则引擎 |
| [emqx\_bridge\_mqtt](https://github.com/emqx/emqx-bridge-mqtt) | etc/plugins/emqx\_bridge\_mqtt.conf | MQTT 消息桥接插件 |
| [emqx\_delayed\_publish](https://github.com/emqx/emqx-delayed-publish) | etc/plugins/emqx\_delayed\_publish.conf | 客户端延时发布消息支持 |
| [emqx\_coap](https://github.com/emqx/emqx-coap) | etc/plugins/emqx\_coap.conf | CoAP 协议支持 |
| [emqx\_lwm2m](https://github.com/emqx/emqx-lwm2m) | etc/plugins/emqx\_lwm2m.conf | LwM2M 协议支持 |
| [emqx\_sn](https://github.com/emqx/emqx-sn) | etc/plugins/emqx\_sn.conf | MQTT-SN 协议支持 |
| [emqx\_stomp](https://github.com/emqx/emqx-stomp) | etc/plugins/emqx\_stomp.conf | Stomp 协议支持 |
| [emqx\_recon](https://github.com/emqx/emqx-recon) | etc/plugins/emqx\_recon.conf | Recon 性能调试 |
| [emqx\_reloader](https://github.com/emqx/emqx-reloader) | etc/plugins/emqx\_reloader.conf | 代码热加载插件 |
| [emqx\_plugin\_template](https://github.com/emqx/emqx-plugin-template) | etc/plugins/emqx\_plugin\_template.conf | 插件开发模版 |

## 启停插件

目前启动插件有以下四种方式：

1. 默认加载
2. 命令行启停插件
3. 使用 Dashboard 启停插件
4. 调用管理 API 启停插件

**开启默认加载**

如需在 EMQ X 启动时就默认启动某插件，则直接在 `data/loaded_plugins` 添加需要启动的插件名称。

例如，目前 EMQ X 自动加载的插件有：

```erlang
{emqx_management, true}.
{emqx_recon, true}.
{emqx_retainer, true}.
{emqx_dashboard, true}.
{emqx_rule_engine, true}.
{emqx_bridge_mqtt, false}.
```

**命令行启停插件**

在 EMQ X 运行过程中，可通过 [CLI - Load/Unload Plugin](cli.md#load_plugin) 的方式查看、和启停某插件。

**使用 Dashboard 启停插件**

若开启了 Dashbord 的插件，可以直接通过访问 `http://localhost:18083/plugins` 中的插件管理页面启停插件。

**使用管理 API 启停插件**

在 EMQ X 运行过程中，可通过 [管理监控 API - Load Plugin](plugins.md#http-api.md#load_plugin) 的方式查看、和启停某插件。

## 插件开发

### 创建插件项目

参考 [emqx\_plugin\_template](https://github.com/emqx/emqx-plugin-template) 插件模版创建新的插件项目。

备注：在 `<plugin name>_app.erl` 文件中必须加上标签 `-emqx_plugin(?MODULE).` 以表明这是一个 EMQ X 的插件。

### 创建 认证/访问控制 模块

接入认证示例代码 - `emqx_auth_demo.erl`：

```erlang
-module(emqx_auth_demo).

-export([ init/1
        , check/2
        , description/0
        ]).

init(Opts) -> {ok, Opts}.

check(_ClientInfo = #{clientid := ClientId, username := Username, password := Password}, _State) ->
    io:format("Auth Demo: clientId=~p, username=~p, password=~p~n", [ClientId, Username, Password]),
    ok.

description() -> "Auth Demo Module".
```

访问控制示例代码 - `emqx_acl_demo.erl`：

```erlang
-module(emqx_acl_demo).

-include_lib("emqx/include/emqx.hrl").

%% ACL callbacks
-export([ init/1
        , check_acl/5
        , reload_acl/1
        , description/0
        ]).

init(Opts) ->
    {ok, Opts}.

check_acl({ClientInfo, PubSub, _NoMatchAction, Topic}, _State) ->
    io:format("ACL Demo: ~p ~p ~p~n", [ClientInfo, PubSub, Topic]),
    allow.

reload_acl(_State) ->
    ok.

description() -> "ACL Demo Module".
```

挂载认证、访问控制钩子示例代码 - `emqx_plugin_template_app.erl`：

```erlang
ok = emqx:hook('client.authenticate', fun emqx_auth_demo:check/2, []),
ok = emqx:hook('client.check_acl', fun emqx_acl_demo:check_acl/5, []).
```

### 挂载钩子

在扩展插件中，可通过挂载 [钩子](hooks.md) 来处理客户端上下线、主题订阅、消息收发等事件。

钩子挂载示例代码 - `emqx_plugin_template.erl`：

```erlang
load(Env) ->
    emqx:hook('client.connect',      {?MODULE, on_client_connect, [Env]}),
    emqx:hook('client.connack',      {?MODULE, on_client_connack, [Env]}),
    emqx:hook('client.connected',    {?MODULE, on_client_connected, [Env]}),
    emqx:hook('client.disconnected', {?MODULE, on_client_disconnected, [Env]}),
    emqx:hook('client.authenticate', {?MODULE, on_client_authenticate, [Env]}),
    emqx:hook('client.check_acl',    {?MODULE, on_client_check_acl, [Env]}),
    emqx:hook('client.subscribe',    {?MODULE, on_client_subscribe, [Env]}),
    emqx:hook('client.unsubscribe',  {?MODULE, on_client_unsubscribe, [Env]}),
    emqx:hook('session.created',     {?MODULE, on_session_created, [Env]}),
    emqx:hook('session.subscribed',  {?MODULE, on_session_subscribed, [Env]}),
    emqx:hook('session.unsubscribed',{?MODULE, on_session_unsubscribed, [Env]}),
    emqx:hook('session.resumed',     {?MODULE, on_session_resumed, [Env]}),
    emqx:hook('session.discarded',   {?MODULE, on_session_discarded, [Env]}),
    emqx:hook('session.takeovered',  {?MODULE, on_session_takeovered, [Env]}),
    emqx:hook('session.terminated',  {?MODULE, on_session_terminated, [Env]}),
    emqx:hook('message.publish',     {?MODULE, on_message_publish, [Env]}),
    emqx:hook('message.delivered',   {?MODULE, on_message_delivered, [Env]}),
    emqx:hook('message.acked',       {?MODULE, on_message_acked, [Env]}),
    emqx:hook('message.dropped',     {?MODULE, on_message_dropped, [Env]}).
```

### 注册 CLI 命令

处理命令行命令示例代码 - `emqx_cli_demo.erl`：

```erlang
-module(emqx_cli_demo).

-export([cmd/1]).

cmd(["arg1", "arg2"]) ->
    emqx_cli:print ("ok");

cmd(_) ->
    emqx_cli:usage ([{"cmd arg1 arg2", "cmd demo"}]).
```

注册命令行示例代码 - `emqx_plugin_template_app.erl`：

```erlang
ok = emqx_ctl:register_command(cmd, {emqx_cli_demo, cmd}, []),
```

插件加载后，使用`./bin/emqx_ctl` 验证新增的命令行：

```bash
./bin/emqx_ctl cmd arg1 arg2
```

### 插件配置文件

插件自带配置文件放置在 `etc/${plugin_name}.conf|config`。 EMQ X 支持两种插件配置格式：

1. Erlang 原生配置文件格式 - `${plugin_name}.config`：

```erlang
[
    {plugin_name, [
    {key, value}
    ]}
].
```

1. sysctl 的 `k = v` 通用格式 - `${plugin_name}.conf`：

```erlang
plugin_name.key = value
```

注：`k = v` 格式配置需要插件开发者创建 `priv/plugin_name.schema` 映射文件。

### 编译和发布插件

clone emqx-rel 项目：

```bash
git clone https://github.com/emqx/emqx-rel.git
```

rebar.config 添加依赖：

```erlang
{deps,
   [ {plugin_name, {git, "url_of_plugin", {tag, "tag_of_plugin"}}}
   , ....
   ....
   ]
}
```

rebar.config 中 relx 段落添加：

```erlang
{relx,
    [...
    , ...
    , {release, {emqx, git_describe},
       [
         {plugin_name, load},
       ]
      }
    ]
}
```

