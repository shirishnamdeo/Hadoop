

tar -zxvf /media/sf_SharedFolder/kafka_2.12-2.8.0.tgz -C /home/notebook/Hadoop
mv /home/notebook/Hadoop/kafka_2.12-2.8.0  /home/notebook/Hadoop/kafka

export KAFKA_HOME=/home/notebook/Hadoop/kafka
export PATH=$PATH:$KAFKA_HOME/bin


# Starting Zookeeper Services
$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties


# Testing Kafka [https://kafka.apache.org/quickstart]
$KAFKA_HOME/bin/kafka-topics.sh --create --topic test_topic --bootstrap-server localhost:9092
$KAFKA_HOME/bin/kafka-topics.sh --describe --topic test_topic --bootstrap-server localhost:9092

$KAFKA_HOME/bin/kafka-console-producer.sh --topic test_topic --bootstrap-server localhost:9092
$KAFKA_HOME/bin/kafka-console-consumer.sh --topic test_topic --from-beginning --bootstrap-server localhost:9092