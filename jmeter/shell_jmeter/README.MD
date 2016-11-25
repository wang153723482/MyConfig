## 利用shell执行jmeter的运行命令，并且生成html报告。

#### 环境
* linux（如果需要win下，需改将sh文件改写成bat）
* jdk1.7+
* jmeter3.0+
* tomcat7+（或其他java web服务器，本文以tomcat7为例）


#### 思路

1. 遍历jmx目录，通过jmeter -n执行每一个jmx脚本

2. 执行jmx以后，通过jmeter -o生成html报告

3. 生成的html直接存放在tomcat的部署目录下，即时查看报告


#### 使用方法（以tomcat7为例，其他web服务器类似）




1. `jmeter_logs.jsp` 放到 $TOMCAT_HOME/webapps/ROOT 下，修改文件内的 `resultPath`,与上文的 `RESULT_PATH` 保持一致，启动tomcat

2. `jmeter_auto.sh` 放到任意目录，修改文件内的 `JMETER_HOME`,`WORKSPACE`,`TOMCAT_HOME`,`RESULT_PATH`。给 `jmeter.auto.sh` 增加执行权限

3. 执行 `jmeter_auto.sh`

4. 访问jmeter_logs.jsp，http://ip:8080/jmeter_logs.jsp 即可。
