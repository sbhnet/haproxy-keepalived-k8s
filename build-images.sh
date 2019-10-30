docker build -t haproxy-k8s $PWD/haproxy-k8s 
docker build -t keepalived-k8s $PWD/keepalived-k8s

docker login --username=krman_1@163.com registry.cn-hangzhou.aliyuncs.com

docker tag haproxy-k8s registry.cn-hangzhou.aliyuncs.com/wanghaiqing/haproxy-k8s:1.8.9
docker push registry.cn-hangzhou.aliyuncs.com/wanghaiqing/haproxy-k8s:1.8.9

docker tag keepalived-k8s registry.cn-hangzhou.aliyuncs.com/wanghaiqing/keepalived-k8s:v1.3.9
docker push registry.cn-hangzhou.aliyuncs.com/wanghaiqing/keepalived-k8s:v1.3.9
 
 
exit 0

Keepalived 提供 kube-apiserver 对外服务的虚拟 IP（VIP）

HAProxy 监听 Keepalived VIP

运行 Keepalived 和 HAProxy 的节点称为 LB（负载均衡） 节点

Keepalived 是一主多备运行模式，故至少需要两个 LB 节点

Keepalived 在运行过程中周期检查本机的 HAProxy 进程状态，如果检测到 HAProxy 进程异常，则触发重新选主的过程，VIP 将飘移到新选出来的主节点，从而实现 VIP 的高可用所有组件（如 kubeclt、apiserver、controller-manager、scheduler 等）都通过 VIP +HAProxy 监听的 6444 端口访问 kube-apiserver 服务 （注意：kube-apiserver 默认端口为 6443，为了避免冲突我们将 HAProxy 端口设置为 6444，其它组件都是通过该端口统一请求 apiserver）
 