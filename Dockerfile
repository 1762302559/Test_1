#拿jdk8为基础镜像
FROM openjdk:8-jre
#WORKDIR指令用于指定容器的一个目录， 容器启动时执行的命令会在该目录下执行。
WORKDIR /
#将当前client.jar 复制到容器根目录下
ADD sinolvc-auth_test_v3.0.1.jar sinolvc-auth_test_v3.0.1.jar
#修改docker时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
#暴露容器端口为8762 Docker镜像告知Docker宿主机应用监听了8762端口
EXPOSE 8816
#容器启动时执行的命令
ENTRYPOINT  ["java","-jar","-Duser.timezone=GMT+8","sinolvc-auth_test_v3.0.1.jar"] 
