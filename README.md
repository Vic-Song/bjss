## Windows 部署方案（Windows7 x64 实践）
- 1.Ruby on Rails 环境配置
  - 下载安装 [RailsInstaller for windows](http://railsinstaller.org/en)，注意勾选添加路径选项，方便命令行使用，否则需要后续手动添加
  - 安装完成后，进入命令行，输入 `ruby -v` 和 `rails -v` 查看 ruby 和 rails 相应版本，正常显示则表示安装无误，否则**重复上一步**
  - 之后可以选择合适路径新建项目进行测试，`rails new demo --skip-bundle`，这里 *skip-bundle* 参数是为了避免由于 *国内网络连接问题* 而导致自动 bundle install 失败
  - 下一步自然就是处理 bundle 的网络问题，找到 demo 路径，编辑 Gemfile 文件，将`source 'https://rubygems.org/'` 修改为 `source 'https://ruby.taobao.org/'`
  再来运行 `bundle install` 即可完成所需 gem 包的安装
    - **此处 `bundle install` 如出现有关 openssl 证书问题，可参考以下步骤解决：**
      - 下载 [CA 证书文件](curl.haxx.se/ca/cacert.pem)，注意一定要加载完成后再复制（血泪教训。。），另存为 cacert.pem 文件
      - 放到 RailsInstaller 安装路径下，在系统环境变量中新建 'SSL_CERT_FILE' 变量，值为 `{RailsInstaller_path}\cacert.pem`，DONE.
- 2.配置 mysql 数据库
  - 安装部署 windows mysql 开发环境，然后新建数据库 `CREATE DATABASE bjss_development`，用作项目数据库
- 3.git clone 项目文件
  - `git clone https://github.com/Vic-Song/bjss`
- 4.进入 bjss 项目路径，依次执行 `bundle install`,`rake db:migrate`,完成 gem 包安装和数据库迁移
- 5.rails s 启动服务器即可（development mode）
***
**好吧还是决定放弃 Windows 部署了，各种‘bad idea’的评价，太折腾，不过上一部分可以作为 Windows 本地开发环境部署参考。申请换了 Linux 服务器，也就有了下一部分**

## Linux(CentOS 6.8) 部署方案
- 1.配置 Ruby on Rails 开发环境，直接参考[这里吧](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-centos-6-with-rvm)。测试方法跟前面的 windows 一样。
- 2.安装并配置 mysql，*（本项目使用 mysql 作为数据库服务器，因为 rails 默认的 sqlite 只能处理单线程访问，无法应对较大访问量）*
  - `yum install mysql-server `
  - 创建数据库并授权相应用户，具体信息参见[配置文件](https://github.com/Vic-Song/bjss/blob/master/config/database.yml)，相应 mysql 命令为 `CREATE DATABASE bjss_development DEFAULT CHARACTER SET utf8;`   `GRANT ALL PRIVILEGES ON bjss_development.* TO 'username'@'localhost' IDENTIFIED BY 'password';`*(username 和 password 按实际配置修改)*
- 3.完成数据库配置后，下载项目文件 `git clone https://github.com/Vic-Song/bjss` 至本地
- 4.进入 bjss 目录，运行 `bundle install` 完成所需 gem 包安装
- 5.进行数据库迁移，`rake db:migrate`
- 6.启动服务器，默认 WEBrick 命令 `rails s`，或使用 passenger （Gemfile 文件已添加）`bundle exec passenger start`，顺利启动，则表示本地运行OK-- 7.接下来是服务器设置，使用 Nginx 作为网络服务器，具体步骤：
  - `yum install nginx`，参考[这里](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-6-with-yum)
  - 配置 Nginx 服务器，使用**反向代理（Reverse Proxy）**方式处理用户 http 请求。
    - 修改 Nginx 配置，文件路径 `/etc/nginx/conf.d/default.conf`，修改 server 部分代码如下（参考[这里](https://www.linuxhelp.com/how-to-configure-nginx-as-a-reverse-proxy-in-centos/)）
    `server{
      listen 80;
      server_name YourDomainNameORIPAddr;
      location/{
        proxy_pass http://localhost:3000;
      }
    }`
    - 重启 Nginx 服务，`service nginx restart`
  - 启动应用服务器，`rails s` 或 `bundle exec passenger start`，此时通过上一步配置中的 `YourDomainNameORIPAddr` 可访问系统，如需服务器一直运行，可采用 daemon 方式运行应用服务器，命令为 `rails s -d` 或 `bundle exec passenger start --daemonize`，Done！
***
###遇到的问题
- 1.`Could not find a JavaScript runtim`,解决 JS 的运行时问题，拢共分三步（具体参见[讨论](https://ruby-china.org/topics/1605)）：
  - `gem install execjs`
  - `gem install therubyracer`
  - `yum install nodejs`
- 2.''
