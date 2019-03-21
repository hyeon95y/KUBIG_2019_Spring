
install.packages("keras")
library(keras)
install_keras()
install.packages("tidyverse")
install.packages("ggplot2")
library(tidyverse)
library(ggplot2)

#training data & test data Ȯ��
train=read.csv("C:/Users/chs76/Desktop/kubig/mnist_train_100.csv",header=F)
test=read.csv("C:/Users/chs76/Desktop/kubig/mnist_test_10.csv",header=F)
train_x=train[,-1]
train_y=train[,1]
test_x=test[,-1]
test_y=test[,1]
train_x=as.matrix(train_x)
test_x=as.matrix(test_x)
train_x=train_x / 255
test_x=test_x / 255
cat(dim(train_x)[[1]], '��: �Ʒ�ǥ��\n')
cat(dim(test_x)[[1]], '��: ����ǥ��\n')
plot(table(train_y),type="h")
plot(table(test_y),type="h")


#epoch=10
train=read.csv("C:/Users/chs76/Desktop/kubig/mnist_train_100.csv",header=F)
test=read.csv("C:/Users/chs76/Desktop/kubig/mnist_test_10.csv",header=F)
train_x=train[,-1]
train_y=train[,1]
test_x=test[,-1]
test_y=test[,1]
train_x=as.matrix(train_x)
test_x=as.matrix(test_x)
train_x=train_x / 255
test_x=test_x / 255
train_y=to_categorical(train_y,10)
test_y=to_categorical(test_y,10)

model = keras_model_sequential()
model %>% 
  layer_dense(units=256, activation="relu", input_shape=c(784))  %>%
  layer_dropout(rate=0.4) %>%
  layer_dense(units = 128, activation = "relu") %>%
  layer_dropout(rate=0.4) %>%
  layer_dense(units=10,activation="softmax") 

summary(model)

#training data ���� validation data�� 20���� ����(���Ƿ� ����)
model %>%
  compile(loss ="categorical_crossentropy",
          optimizer = "adam",
          metrics= c("accuracy"))
history <- model %>% fit(train_x, train_y, epochs = 10, batch_size = 128,
                         callbacks = callback_tensorboard(log_dir = "logs/run_b"),
                         validation_split = 0.2) 
history$metrics

score <- model %>% 
  evaluate(test_x, test_y, batch_size=128)
cat("��Ȯ��(Accurracy: ", scales::percent(score[[2]]), "\n")


#epoch=50
train=read.csv("C:/Users/hongsuk/Desktop/ȫ��/mnist_train_100.csv",header=F)
test=read.csv("C:/Users/hongsuk/Desktop/ȫ��/mnist_test_10.csv",header=F)
train_x=train[,-1]
train_y=train[,1]
test_x=test[,-1]
test_y=test[,1]
train_x=as.matrix(train_x)
test_x=as.matrix(test_x)
train_x=train_x / 255
test_x=test_x / 255
train_y=to_categorical(train_y,10)
test_y=to_categorical(test_y,10)

model = keras_model_sequential()
model %>% 
  layer_dense(units=256, activation="relu", input_shape=c(784))  %>%
  layer_dropout(rate=0.4) %>%
  layer_dense(units = 128, activation = "relu") %>%
  layer_dropout(rate=0.4) %>%
  layer_dense(units=10,activation="softmax") 

summary(model)

#training data ���� validation data�� 20���� ����(���Ƿ� ����)
model %>%
  compile(loss ="categorical_crossentropy",
          optimizer = "adam",
          metrics= c("accuracy"))
history <- model %>% fit(train_x, train_y, epochs = 50, batch_size = 128,
                         callbacks = callback_tensorboard(log_dir = "logs/run_b"),
                         validation_split = 0.2) 
history$metrics

score <- model %>% 
  evaluate(test_x, test_y, batch_size=128)
cat("��Ȯ��(Accurracy: ", scales::percent(score[[2]]), "\n")

#epoch�� 10�� 50���� ������ �� ������ �󸶳� ��Ȯ���� �ö󰡴��� �����ֱ� ����.