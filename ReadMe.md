# Mirai-docker

[Mirai Console Loader](https://github.com/iTXTech/mirai-console-loader) 和 [mirai-api-http](https://github.com/project-mirai/mirai-api-http) 的Docker启动环境

## 使用

1. 生成配置文件

    ```bash
    docker run --rm -it --name="mirai" -v ./mirai/config:/app/config xzsk2/mirai-docker:latest
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

3. 启动，端口根据`mirai-api-http`的配置文件修改，默认端口为`8080`

    ```bash
    docker run -d --name="mirai" -p 8080:8080 -v ./mirai/config:/app/config xzsk2/mirai-docker:latest
    ```

4. 更新，使用 [Watchtower](https://github.com/containrrr/watchtower)

    ```bash
    docker run --rm \
        -v /var/run/docker.sock:/var/run/docker.sock \
        containrrr/watchtower -c \
        --run-once \
        mirai
    ```
