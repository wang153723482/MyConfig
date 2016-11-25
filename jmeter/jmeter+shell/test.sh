#!/bin/bash
#
# ggx&wangc  20161122
# 执行指定目录下所有的jmx脚本，生成html报告存放到指定目录，通过tomcat浏览
# todo:
# 1.html结果按日期排序
# 2.增加指定jmx脚本运行
#

# variable initialization
JMETER_HOME=/home/testing/soft/apache-jmeter-3.0
WORKSPACE=/home/testing/ggx
TOMCAT_HOME=/home/testing/soft/tomcat8
RESULT_PATH=/results

# set local variable
__current_time=`date +%Y%M%d%H%m%S`
# jmx的存放路径
__path_jmx=${WORKSPACE}/jmx
# jtl的存放路径
__path_jtl=${WORKSPACE}/jtl
# HTML的存放路径，也可以放到tomcat以外的路径，具体自行搜索 tomcat 新增 context
__path_html=${TOMCAT_HOME}/webapps/ROOT${RESULT_PATH}


# check valid path
if [ ! -d ${__path_jmx} ] ; then
  mkdir ${__path_jmx}
fi

if [ ! -d ${__path_jtl} ] ; then
  mkdir ${__path_jtl}
fi

if [ ! -d ${__path_html} ] ; then
  mkdir ${__path_html}
fi

cd $__path_jmx

filelist=`ls *.jmx`  
for file in $filelist
do
  # get file name
  __filename=${file%.*}
  # get file suffix
  __filesuffix=${file##*.}

  __jmx_name=${__path_jmx}/${file}
  __jtl_name=${__path_jtl}/${__filename}'_'${__current_time}'.jtl'
  __html_name=${__path_html}/${__filename}'_'${__current_time}
  
  if [ -f ${__jtl_name} ] ;  then
    rm ${__jtl_name}
  fi
  
  if [ ! -d ${__html_name} ]; then
     mkdir ${__html_name}
  fi

  echo ${__jmx_name}
  echo ${__jtl_name}
  echo ${__html_name}
  ${JMETER_HOME}/bin/jmeter.sh -n -t ${__jmx_name} -l ${__jtl_name}
  ${JMETER_HOME}/bin/jmeter.sh -g ${__jtl_name} -o ${__html_name}
 
done

