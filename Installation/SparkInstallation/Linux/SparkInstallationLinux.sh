
tar -xvf /media/sf_SharedFolder/spark-3.1.1-bin-hadoop2.7.tgz -C /home/notebook/Hadoop/
mv /home/notebook/Hadoop/spark-3.1.1-bin-hadoop2.7/ /home/notebook/Hadoop/spark

# vim .bashrc
export SPARK_HOME=/home/notebook/Hadoop/spark/
export SPARK_BIN=/home/notebook/Hadoop/spark/bin
export PATH=$PATH:$SPARK_BIN


# spark-shell