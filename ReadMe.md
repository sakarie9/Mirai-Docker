# Mirai-docker

[![Docker](https://img.shields.io/docker/cloud/automated/xzsk2/mirai-docker)](https://hub.docker.com/repository/docker/xzsk2/mirai-docker)

[Mirai Console Loader](https://github.com/iTXTech/mirai-console-loader) 和 [mirai-api-http](https://github.com/project-mirai/mirai-api-http) 的Docker启动环境

**建议使用 [TG-EFB-QQ-Docker](https://github.com/xzsk2/TG-EFB-QQ-Docker) 进行QQ到Telegram的双向消息转发**

## 使用

1. 生成配置文件

    ```bash
    docker run --rm -it --name="mirai" -v $PWD/mirai/config:/app/config xzsk2/mirai-docker:latest
    ```

2. 编辑`./mirai/config/net.mamoe.mirai-api-http/setting.yml`，样例如下

    ```yaml

    ## 启用的 adapter, 请确保 http 和 ws 列在下方
    adapters:
    - http
    - ws

    ## 是否开启认证流程, 若为 true 则建立连接时需要验证 verifyKey
    ## 强烈建议开启
    enableVerify: true
    verifyKey: <这里设置一个随机的足够长的字符串>

    ## 开启一些调式信息
    debug: false

    ## 是否开启单 session 模式, 若为 true，则自动创建 session 绑定 console 中登录的 bot
    ## 开启后，接口中任何 sessionKey 不需要传递参数
    ## 若 console 中有多个 bot 登录，则行为未定义
    ## 确保 console 中只有一个 bot 登陆时启用
    ## 这里可以留为 false
    singleMode: false

    ## 历史消息的缓存大小
    ## 同时，也是 http adapter 的消息队列容量
    cacheSize: 4096

    ## adapter 的单独配置，键名与 adapters 项配置相同
    adapterSettings:
    ## 详情看 http adapter 使用说明 配置
    http:
        host: localhost
        port: 8080
        cors: [*]

    ## 详情看 websocket adapter 使用说明 配置
    ws:
        host: localhost
        port: 8080
        reservedSyncId: -1

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
