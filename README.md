## Windows 部署方案（个人 Windows7 x64 实践）
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
相关问题随手记
