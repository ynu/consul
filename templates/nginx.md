# nginx负载均衡配置的consul-template模板设置
本文描述当我们将web服务注册到consul之后，如何使用consul-template生成nginx的相关配置节

## 在consul中注册web服务

### 示例描述
假如我们现在有一个web服务，我们将其命名为“book-web"。此服务由两台服务器提供服务，地址分别是：`http://10.0.0.1:8080`和`http://10.0.0.2:8080`，域名是 `book.itc.ynu.edu.cn`。现在我们要使用nginx来为此web服务提供负载均衡。

### 注册服务
首先，我们需要在consul上注册此web服务。服务配置脚本如下：
```
{
  "services": [
    {
      "id": "book-web-0",
      "name": "book-web",
      "tags": ["nginx","master"],
      "address": "10.0.0.1",
      "port": 8080,
    },
    {
      "id": "book-web-1",
      "name": "book-web",
      "tags": ["slave", "nginx"],
      "address": "10.0.0.1",
      "port": 8080
    }
  ]
}
```

需要注意的是：
- 提供服务的实服务器有几台就需要注册几个服务；
- 每个服务都必须有一个名为`nginx`的tag，用于标记此服务将使用nginx进行负载均衡；
- 每个服务的`id`不能相同，但提供相同功能的服务的这一组服务的`name`必须相同；
- 为了代码简洁，上述配置没有给出`checks`节的相关配置，用户可自行添加。

### 设置相关kv值
由于注册服务时有些信息无法在脚本中给出，因此，我们还需要使用consul自带的键值数据库系统添加额外的配置。
设置步骤如下：
1. 在键值系统的`/web`目录下新建一个 *名称与注册在consul中的服务一样* 的目录，此示例中，我们建立名为`book-web`的目录；
2. 在新建的目录（此处为`book-web`）下新建一个用于配置域名的键`domain`，其值设置为想要提供服务的域名，此示例为`book.itc.ynu.edu.cn`。

### 










