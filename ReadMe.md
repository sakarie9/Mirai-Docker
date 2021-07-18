# Mirai-docker

[Mirai Console Loader](https://github.com/iTXTech/mirai-console-loader) 和 [mirai-api-http](https://github.com/project-mirai/mirai-api-http) 的Docker启动环境

**建议使用 [TG-EFB-QQ-Docker](https://github.com/xzsk2/TG-EFB-QQ-Docker) 进行QQ到Telegram的双向消息转发**

## 使用

1. 生成配置文件

    ```bash
    docker run --rm -it --name="mirai" -v $PWD/mirai/config:/app/config xzsk2/mirai-docker:latest
    ```

2. 编辑`./mirai/config/net.mamoe.mirai-api-http/setting.yml`，样例如下

    ```yaml
    cors: 
        - '*'
    host: 0.0.0.0
    port: 8080 # 端口
    authKey: xxxxxxxxx # 修改authKey
    cacheSize: 4096
    enableWebsocket: true # 确保修改为true
    report: 
        enable: true # 确保修改为true
        groupMessage: 
            report: true
        friendMessage: 
            report: true
        tempMessage: 
            report: true
        eventMessage: 
        report: true
    destinations: []
    extraHeaders: {}

    heartbeat: 
        enable: false
        delay: 1000
        period: 15000
        destinations: []
        extraBody: {}

        extraHeaders: {}

    ```

3. 进入容器配置自动登录，输入`/help`查看自动登录指令

    ```bash
    docker run --rm -it --name="mirai" -p 8080:8080 -v $PWD/mirai/config:/app/config xzsk2/mirai-docker:latest
    ```

4. 配置完自动登陆后再次启动使用此命令

    ```bash
    docker run -d --name="mirai" -p 8080:8080 -v $PWD/mirai/config:/app/config xzsk2/mirai-docker:latest
    ```

5. 更新，使用 [Watchtower](https://github.com/containrrr/watchtower)

    ```bash
    docker run --rm \
        -v /var/run/docker.sock:/var/run/docker.sock \
        containrrr/watchtower -c \
        --run-once \
        mirai
    ```
