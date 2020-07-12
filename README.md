# ShardingSphere

tb_order.sql

tb_order_item.sql 

#用于生成mybatis generate代码

#通过dubbo-rpc的方式去leaf服务拿

#主要分片逻辑：
```
spring:
  main:
    allow-bean-definition-overriding: true
  application:
    name: sharding-jdbc
  shardingsphere:
    props:
      sql:
        show: true
    datasource:
      names: ds0,ds1
      ds0:
        type: com.zaxxer.hikari.HikariDataSource
        driver-class-name: com.mysql.jdbc.Driver
        jdbc-url: jdbc:mysql://47.CC4.130.105:3306/myshop_0?useUnicode=true&characterEncoding=utf-8&serverTimezone=Hongkong&useSSL=false
        username: root
        password: 'root'
        hikari:
          minimum-idle: 5
          idle-timeout: 600000
          maximum-pool-size: 10
          auto-commit: true
          pool-name: MyHikariCP
          max-lifetime: 1800000
          connection-timeout: 30000
          connection-test-query: SELECT 1
      ds1:
        type: com.zaxxer.hikari.HikariDataSource
        driver-class-name: com.mysql.jdbc.Driver
        jdbc-url: jdbc:mysql://121.CC9.65.124:3306/myshop_1?useUnicode=true&characterEncoding=utf-8&serverTimezone=Hongkong&useSSL=false
        username: root
        password: 'root'
        hikari:
          minimum-idle: 5
          idle-timeout: 600000
          maximum-pool-size: 10
          auto-commit: true
          pool-name: MyHikariCP
          max-lifetime: 1800000
          connection-timeout: 30000
          connection-test-query: SELECT 1
    sharding:
#      绑定表规则列表
      binding-tables: tb_order,tb_order_item
#      默认数据库分片策略，同分库策略
      default-database-strategy:
        inline:
#          分片算法行表达式，需符合groovy语法
#          此处根据user_id分片
#          如果user_id为奇数则落入奇数库即ds1匹配的数据源
          algorithm-expression: ds$->{user_id % 2}
#          分片列名称
          sharding-column: user_id
#          数据分片规则配置，可配置多个
      tables:
#        逻辑表名
        tb_order:
#          由数据源名+表名组成，以小数点分隔
          actual-data-nodes: ds$->{0..1}.tb_order_$->{0..1}
#          分表策略，同分库策略
          table-strategy:
            inline:
#              此处根据order_id分片，奇数tb_order_1,偶数tb_order_0
              algorithm-expression: tb_order_$->{order_id % 2}
              sharding-column: order_id
        tb_order_item:
          actual-data-nodes: ds$->{0..1}.tb_order_item_$->{0..1}
          table-strategy:
            inline:
              algorithm-expression: tb_order_item_$->{order_id % 2}
              sharding-column: order_id
```
