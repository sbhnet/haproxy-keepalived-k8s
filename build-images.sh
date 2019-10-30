docker build -t haproxy-k8s $PWD/haproxy-k8s 
docker build -t keepalived-k8s $PWD/keepalived-k8s

docker login --username=krman_1@163.com registry.cn-hangzhou.aliyuncs.com

docker tag haproxy-k8s registry.cn-hangzhou.aliyuncs.com/wanghaiqing/haproxy-k8s:1.8.9
docker push registry.cn-hangzhou.aliyuncs.com/wanghaiqing/haproxy-k8s:1.8.9

docker tag keepalived-k8s registry.cn-hangzhou.aliyuncs.com/wanghaiqing/keepalived-k8s:v1.3.9
docker push registry.cn-hangzhou.aliyuncs.com/wanghaiqing/keepalived-k8s:v1.3.9