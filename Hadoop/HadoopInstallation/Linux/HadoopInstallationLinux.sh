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
# ssh localhost


# Installing HDFS
mkdir /home/notebook/Hadoop
tar -zxvf /media/sf_SharedFolder/hadoop-3.2.1.tar.gz -C /home/notebook/Hadoop
mv /home/notebook/Hadoop/hadoop-3.2.1  /home/notebook/Hadoop/hadoop321


vim .bashrc

export HADOOP_HOME=/home/notebook/Hadoop/hadoop321
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

