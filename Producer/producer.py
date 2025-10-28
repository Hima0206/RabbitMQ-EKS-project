import pika
import os
import time

# Environment variables
RABBITMQ_URL = os.getenv('RABBITMQ_URL', 'amqp://guest:guest@localhost:5672/')
QUEUE_NAME = os.getenv('QUEUE_NAME', 'default_queue')

# Setup connection
url_params = pika.URLParameters(RABBITMQ_URL)
connection = pika.BlockingConnection(url_params)
channel = connection.channel()

# Declare queue
channel.queue_declare(queue=QUEUE_NAME, durable=True)

# Continuous message producer
count = 1
while True:
    message = f"Message {count}"
    channel.basic_publish(
        exchange='',
        routing_key=QUEUE_NAME,
        body=message,
        properties=pika.BasicProperties(
            delivery_mode=2,  # make message persistent
        )
    )
    print(f"Sent: {message}")
    count += 1
    time.sleep(1)  # delay between messages

# Close resources (though in an infinite loop, this won’t be reached)
channel.close()
connection.close()
