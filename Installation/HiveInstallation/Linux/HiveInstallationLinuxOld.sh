
Download Hive (from Apache Hive)
I have choosed hive-2.3.4 (you can choose the latest one from there, hive 3 is also available)



Hive also requires CLASSPATH variable to be updated (in order to point to where hive jars lives).

export CLASSPATH=$CLASSPATH:$HADOOP_HOME/lib/*  [Not required by Hive by I guess needed for Hadoop, althought I have seen HAdoop works without this also]

export CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/*





Hive Configuration:

hive-install/conf 

Copy hive-default.xml.template  ot hive-site.xml

1. Check for ConnectionURL property.
	This property tell us what Database we want to use as a metastore.
	We will use buint in Derby database, and run it as an embedded metastore. 




2. hive.metastore.warehouse.dir
[This is the specific place on the HDFS where hive stores all its data.]
Which by default points to /user/hive/warehouse


3. Replace all instances of ${system:java.io.tmpdir} with /tmp/hive_io  [4 replacements]
This is the place where hive stores its temperorary files.


4. Replace all instances of ${system:user.name} with the user name I have on my machine [3 replacement]


Ensure all hadoop processes are Running. [3 hdfs processes and 2 yarn processes]


Make /tmp dir on hdfs for hive to use.


hdfs dfs -mkdir /tmp
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/hive
hdfs dfs -mkdir /user/hive/warehouse


[Give group write permission to ]
hdfs dfs -chmod g+w /tmp
hdfs dfs -chmod g+w /user/hive/warehouse


Launch hive $ hive

hive> show databases;
FAILED: SemanticException org.apache.hadoop.hive.ql.metadata.HiveException: java.lang.RuntimeException: Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient

Either launching hive may give an error, and if not any db command will give an error thatt Metastore database for hive is still not initialized.


We need to instantiate metastore
schematool -initSchema -dbType derby  [Run this command in hive-install directory]

Output:
Initialization script completed
schemaTool completed


After this metastore_db will be created in hive-install folder.

Now show databases; will show a default database.
notebook@notebook:~$ hdfs dfs -ls /user/hive/warehouse/notebookdb.db/test_table
Found 3 items
-rw-r--r--   1 notebook supergroup         14 2020-04-01 02:43 /user/hive/warehouse/notebookdb.db/test_table/000000_0
-rw-r--r--   1 notebook supergroup         14 2020-04-01 02:44 /user/hive/warehouse/notebookdb.db/test_table/000000_0_copy_1
-rw-r--r--   1 notebook supergroup         14 2020-04-01 02:44 /user/hive/warehouse/notebookdb.db/test_table/000000_0_copy_2




Ports Information:-

HMaster: 60000
HMaster Web UI: http://localhost:16010 HTTP (after version 0.98, port has changed from 60010 to 16010)
Region Server: 60020
Region Server: 60030 HTTP






Exception in thread "main" java.lang.NoSuchMethodError: com.google.common.base.Preconditions.checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V
-- https://stackoverflow.com/questions/58176627/how-can-i-ask-hive-to-provide-more-detailed-error
rm /opt/shared/apache-hive-3.1.2-bin/lib/guava-19.0.jar
$ cp /opt/shared/hadoop-3.2.1/share/hadoop/hdfs/lib/guava-27.0-jre.jar /opt/shared/apache-hive-3.1.2-bin/lib/
Didnt worked for me!!

https://superuser.com/questions/1492421/i-cant-run-hive-in-command-lie/1501841#1501841

Solution: I have installed hadoop v- 3.1.2 instead of 3.2.1 (now working). Hive version is Hive 3.1.2
OR 
rm $HIVE_HOME/lib/guava-14.0.1.jar
cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/


