
# Download: https://mirrors.estointernet.in/apache/hive/hive-2.3.8/apache-hive-2.3.8-bin.tar.gz


tar -zxvf /media/sf_SharedFolder/apache-hive-2.3.8-bin.tar.gz -C /home/notebook/Hadoop/
mv /home/notebook/Hadoop/apache-hive-2.3.8-bin/ /home/notebook/Hadoop/hive

# vim .bashrc
export HIVE_HOME=/home/notebook/Hadoop/hive/
export HIVE_BIN=/home/notebook/Hadoop/hive/bin
export PATH=$PATH:$HIVE_BIN

cp /media/sf_SharedFolder/hive-config.sh /home/notebook/Hadoop/hive/bin
cp /media/sf_SharedFolder/hive-site.xml /home/notebook/Hadoop/hive/conf

/home/notebook/Hadoop/hive/conf/

# Make following direcotries on hdfs for hive to use.
hdfs dfs -mkdir /tmp
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/hive
hdfs dfs -mkdir /user/hive/warehouse


# Add write and execute permissions to tmp group members:
hdfs dfs -chmod g+w /tmp
hdfs dfs -chmod g+w /user/hive/warehouse

# Exception in thread "main" java.lang.NoSuchMethodError: com.google.common.base.Preconditions.checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V
rm $HIVE_HOME/lib/guava-14.0.1.jar
cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/


# Initiate Derby Database. 
# IMPORTANT: This command needs to be run from $HIVE_HOME and must create metastore_db in $HIVE_HOME directory
# Also seems like derby doesnot support more than one sumultaneous connections.
cd $HIVE_HOME
$HIVE_HOME/bin/schematool -initSchema -dbType derby



# Hive Installation Test:
hive> show databases;

hive> CREATE DATABASE notebookdb;  
hdfs dfs -ls user/hive/warehouse/notebookdb.db  -- Should be created.

hive> CREATE TABLE test_table (attribute1 STRING);
hive> INSERT INTO test_table (attribute1) VALUES ('attribute1_value1');
hive> INSERT INTO test_table (attribute1) VALUES ('attribute1_value2');
# hdfs dfs -ls /user/hive/warehouse/notebookdb.db/test_table


