## 利用shell执行jmeter的运行命令，并且生成html报告。

#### 环境
* linux（如果需要win下，需改将sh文件改写成bat）
* jdk1.7+
* jmeter3.0+
* tomcat7+（apache、nginx...）


1. 遍历jmx目录，通过jmeter -n执行每一个jmx脚本

2. 执行jmx以后，通过jmeter -o生成html报告

3. 配合tomcat或其他web服务器，即时查看报告
