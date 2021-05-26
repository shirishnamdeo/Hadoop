# Installation steps [PseudoD-Distributed Mode]:

sudo apt update
sudo apt install openjdk-8-jdk
sudo apt install openssh-server openssh-client 
sudo apt install ssh
sudo apt install pdsh

# Setting up passwordless SSH
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# Try running below command to verify
# ssh localhost (try this command on shell, and make sure it doesn't need password to login)


# Installing HDFS
mkdir /home/notebook/Hadoop
tar -zxvf /media/sf_SharedFolder/hadoop-3.2.1.tar.gz -C /home/notebook/Hadoop
mv /home/notebook/Hadoop/hadoop-3.2.1  /home/notebook/Hadoop/hadoop321


vim .bashrc

export HADOOP_HOME=/home/notebook/Hadoop/hadoop
export HADOOP_BIN=$HADOOP_HOME/bin
export HADOOP_SBIN=$HADOOP_HOME/sbin
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_INSTALL=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JAVA_BIN=/usr/lib/jvm/java-8-openjdk-amd64/bin
export PATH=$JAVA_HOME:$JAVA_BIN:$JAVA_JDK_BIN:$PATH


# Added because of permission error during start-dfs
export PDSH_RCMD_TYPE=ssh

cp /media/sf_SharedFolder/core-site.xml /home/notebook/Hadoop/hadoop/etc/hadoop
cp /media/sf_SharedFolder/hdfs-site.xml /home/notebook/Hadoop/hadoop/etc/hadoop
cp /media/sf_SharedFolder/mapred-site.xml /home/notebook/Hadoop/hadoop/etc/hadoop
cp /media/sf_SharedFolder/yarn-site.xml /home/notebook/Hadoop/hadoop/etc/hadoop
cp /media/sf_SharedFolder/hadoop-env.sh /home/notebook/Hadoop/hadoop/etc/hadoop

mkdir -p /home/notebook/Hadoop/hadoop/tmp
mkdir -p /home/notebook/Hadoop/hdfs/data/hadoop/namenode
mkdir -p /home/notebook/Hadoop/hdfs/data/hadoop/datanode


mkdir -p /home/notebook/Hadoop/HadoopLog

$HADOOP_HOME/bin/hdfs namenode -format 2>&1 | tee -a /home/notebook/Hadoop/HadoopLog/${log_text}_NamenodeFormat.log


$HADOOP_HOME/sbin/start-dfs.sh  2>&1 | tee -a /home/notebook/Hadoop/HadoopLog/${log_text}_StartDfs.log
$HADOOP_HOME/sbin/start-yarn.sh 2>&1 | tee -a /home/notebook/Hadoop/HadoopLog/${log_text}_StartYarn.log


# Follning processes must all start
# 12786 Jps
# 11636 DataNode
# 12326 ResourceManager
# 12470 NodeManager
# 11869 SecondaryNameNode
# 11502 NameNode

# Creating HDFS directories
hdfs dfs -mkdir /apps/
hdfs dfs -mkdir /apps/data
hdfs dfs -mkdir /tmp
hdfs dfs -put /home/notebook/Hadoop/hadoop/etc/hadoop/* /tmp


$HADOOP_HOME/sbin/stop-dfs.sh  | tee -a /home/notebook/Hadoop/HadoopLog/${log_text}_StopDfs.log
$HADOOP_HOME/sbin/stop-yarn.sh | tee -a /home/notebook/Hadoop/HadoopLog/${log_text}_StopYarn.log



# YARN  WEB UI : http://localhost:8088/
# Namenode WEB UI : http://localhost:9870
# Datanode WEB UI :http://localhost:9864