# get\_subs\_from\_mysql

搭建 MySQL 数据库，并设置用户名密码为 root/public，以 MacOS X 为例:

```bash
$ brew install mysql

$ brew services start mysql

$ mysql -u root -h localhost -p

ALTER USER 'root'@'localhost' IDENTIFIED BY 'public';
```

初始化 MySQL 数据库:

```bash
$ mysql -u root -h localhost -ppublic

create database mqtt;
```

创建 mqtt\_sub 表:

```sql
DROP TABLE IF EXISTS `mqtt_sub`;

CREATE TABLE `mqtt_sub` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` varchar(64) DEFAULT NULL,
  `topic` varchar(180) DEFAULT NULL,
  `qos` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mqtt_sub_idx` (`clientid`,`topic`,`qos`),
  UNIQUE KEY `mqtt_sub_key` (`clientid`,`topic`),
  INDEX topic_index(`id`, `topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;
```

::: danger

订阅关系表结构不能修改，请使用上面SQL语句创建

:::

创建规则:

打开 [EMQ X Dashboard](http://127.0.0.1:18083/#/rules)，选择左侧的“规则”选项卡。

然后填写规则 SQL:

```bash
SELECT * FROM "$events/client_connected"
```

关联动作:

在“响应动作”界面选择“添加动作”，然后在“新增动作”下拉框里选择“从MySQL中获取订阅列表”

填写动作参数:

“从 MySQL 中获取订阅列表”动作需要一个参数：

1\). 关联资源。现在资源下拉框为空，可以点击右上角的 “新建” 来创建一个 MySQL 资源：

弹出“创建资源”对话框

填写资源配置:

填写真实的 MySQL 服务器地址，其他配置相应的值，然后点击 “测试连接” 按钮，确保连接测试成功。

最后点击 “确定” 按钮。

返回响应动作界面，点击 “确认”。

返回规则创建界面，点击 “创建”。

规则已经创建完成，通过 “mysql” 往MySQL插入一条订阅关系:

```text
insert into mqtt_sub(clientid, topic, qos) values("test", "t1", 1);
```

通过 Dashboard 登录 clientid 为 test 的设备:

查看“订阅”列表，可以看到 Broker 从 MySQL 里面获取到订阅关系，并代理设备订阅:

