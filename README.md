# EPASearch
EPA Data Catalogue Search - ElasticSearch  


## Contents:  
- [EPASearch](#epasearch)
  - [Required Languages and Technologies](#required-languages-and-technologies)
    - [Port Checking](#port-checking)
    - [Microsoft Dependencies and Development Tools](#microsoft-dependencies-and-development-tools)
      - [VCRUNTIME140.dll C++ Redistributable for Visual Studio 2015 RC](#vcruntime140dll-c-redistributable-for-visual-studio-2015-rc)
      - [Microsoft Visual C++ 2010 Redistributable Package (x86)](#microsoft-visual-c-2010-redistributable-package-x86)
      - [Microsoft Visual C++ Build Tools 2015](#microsoft-visual-c-build-tools-2015)
      - [Microsoft Visual Studio 2017 and .NET Core](#microsoft-visual-studio-2017-and-net-core)
        - [Microsoft Visual Studio 2017 Community](#microsoft-visual-studio-2017-community)
        - [MS VS2017 R Client Setup](#ms-vs2017-r-client-setup)
    - [Nginx](#nginx)
    - [Eclipse](#eclipse)
    - [PHP](#php)
      - [Composer](#composer)
      - [Pear](#pear)
      - [Zend Framework](#zend-framework)
      - [Laravel](#laravel)
      - [PECL Intl](#pecl-intl)
    - [Python 3.4](#python-34)
      - [Pip-review](#pip-review)
      - [Virtualenv](#virtualenv)
      - [Python 2.7 (ElastAlert)](#python-27-elastalert)
        - [Pip-review 2.7](#pip-review-27)	
    - [Ruby](#ruby)    
      - [Ruby 23-x64](#ruby-23-x64)
      - [RubyGems 2.6.11](#rubygems-2611)
        - [Bundler](#bundler)	
      - [JRuby 9.1.12.0](#jruby-91120)      
    - [Perl](#perl)
      - [cpanm](#cpanm)
    - [Scala](#scala)
    - [Git](#git)
      - [Configure GIT Cert Path](#configure-git-cert-path)
      - [EGit (Git For Eclipse)](#egit-git-for-eclipse)
    - [Docker](#docker)
      - [boot2docker - Behind Corporate Proxy](#boot2docker---behind-corporate-proxy)
      - [Docker Cygwin](#docker-cygwin)
    - [Virtual Machines](#virtual-machines)
      - [Vagrant](#vagrant)
      - [Oracle VM VirtualBox](#oracle-vm-virtualbox)
    - [Cygwin](#cygwin)
    - [NodeJS](#nodejs)
    - [React](#react)
    - [Wget](#wget)
    - [HTTPie](#httpie)
  - [Databases](#databases)
    - [Hadoop 2.7.1](#hadoop-271)
      - [Apache HBase 1.30](#apache-hbase-130)      
    - [Apache Hive 2.0.1](#apache-hive-201)
    - [Apache Drill 1.10](#apache-drill-110)
    - [MySQL](#mysql)
    - [MongoDB](#mongodb)
      - [RoboMongo UI](#robomongo-ui)
        - [MongoDB Delete](#mongodb-delete)
    - [Postgres 9.6.2](#postgres-962)
      - [PostgreSQL 9.3 (Deprecated)](#postgresql-93-deprecated)
  - [Apache](#apache)
    - [Apache HTTPD Server 2.4 Binary Win64](#apache-httpd-server-24-binary-win64)
    - [Apache Maven 3.3.9](#apache-maven-339)
    - [Apache Ant 1.9.7](#apache-ant-197)
    - [Apache Tika 1.15](#apache-tika-115)
        - [Tika JAR recompile (deprecated)](#tika-jar-recompile-deprecated)
    - [Apache Zookeeper 3.4.6](#apache-zookeeper-346)
    - [Apache Kafka 0.10.1.1](#apache-kafka-01011)
    - [Apache Spark](#apache-spark)
      - [Apache Spark 1.6.3](#apache-spark-163)
      - [Apache Spark 2.0.0](#apache-spark-200)
      - [Apache Spark 2.1.0](#apache-spark-210)
    - [Apache Mahout 0.12.2](#apache-mahout-0122)
    - [Apache Zeppelin 0.7.2](#apache-zeppelin-072)
    - [Apache Nutch](#apache-nutch)
      - [Apache Nutch 1.1](#apache-nutch-11)
        - [Create URL List to Crawl](#create-url-list-to-crawl)
      - [Apache Nutch 1.3](#apache-nutch-13)
        - [Create URL List to Crawl](#create-url-list-to-crawl)
        - [HBase Nutch Config](#hbase-nutch-config)
      - [Apache Nutch 2.3](#apache-nutch-23)
    - [Apache OFBiz 16.11.01](#apache-ofbiz-161101)
    - [Apache Mesos 1.3.0](#apache-mesos-130)
    - [Apache Tomcat 8.0.33](#apache-tomcat-8033)
    - [Apache ManifoldCF](#apache-manifoldcf)
  - [REST API](#rest-api)
    - [Python-EVE](#python-eve)
      - [Eve-Swagger](#eve-swagger)
      - [Eve-Elastic](#eve-elastic)
    - [Zend_Rest_Server()](#zend_rest_server)
    - [Ramses, Elasticsearch, Postgres, MongoDB](#ramses-elasticsearch-postgres-mongodb)
    - [Swagger](#swagger)
    - [Swagger-UI](#swagger-ui)
    - [Pyramid-Swagger](#pyramid-swagger)
    - [Visual Studio WebAPI 2.0](#visual-studio-webapi-20)
    - [Open Data API Examples](#open-data-api-examples)
  - [MediaWiki](#mediawiki)
    - [MediaWiki 1.28.0](#mediawiki-1280)
    - [Wikibase](#wikibase)
    - [ImageMagick 7.0.3 Win64](#imagemagick-703-win64)
  - [Appendix](#appendix)
    - [Proxy Settings](#a-nameproxysettingsaproxy-settings)
      - [Windows CLI](#windows-abbr-titlecommand-line-interfacecliabbr)
      - [Windows CLI – Composer](#windows-abbr-titlecommand-line-interfacecliabbr-composer)
      - [Windows CLI – NPM (Node Package Manager)](#a-nameproxysettingsnpmawindows-abbr-titlecommand-line-interfacecliabbr-npm-node-package-manager)
      - [ Linux CLI (e.g. MinTTY, MINGW64 (Git Bash))](#a-nameproxysettingsbasha-linux-abbr-titlecommand-line-interfacecliabbr-eg-mintty-mingw64-git-bash)
    - [MD/Github Editing](#mdgithub-editing)
  - [Deprecated](#deprecated)
    - [HDFSExplorer (Hadoop - deprecated)](#hdfsexplorer-hadoop-deprecated)
  - [Sandbox](#sandbox)
## Required Languages and Technologies  

### Port Checking

Resource Monitor can be used to investigate port binding issues (this crops up with Hadoop)

`C:\Windows\System32\resmon.exe`

### Microsoft Dependencies and Development Tools

#### VCRUNTIME140.dll C++ Redistributable for Visual Studio 2015 RC 

Required for Apache HTTPD Server 2.4   

Install: <https://www.microsoft.com/en-us/download/details.aspx?id=48145>

`vc\_redist.x64.exe`


#### Microsoft Visual C++ 2010 Redistributable Package (x86)

Required for Python 3.6  

Install: <https://www.microsoft.com/en-ie/download/details.aspx?id=5555>

Direct: <https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe>


#### Microsoft Visual C++ Build Tools 2015

Required for Python  

Tutorial: <http://landinghub.visualstudio.com/visual-cpp-build-tools>  

Install:
<http://go.microsoft.com/fwlink/?LinkId=691126&__hstc=268264337.cd1426073883d2a3d7bd6452bb3a4db4.1486470180494.1486470180494.1486470180494.1&__hssc=268264337.1.1486470180494&__hsfp=1625046512&fixForIE=.exe>




#### Microsoft Visual Studio 2017 and .NET Core

##### Microsoft Visual Studio 2017 Community

Install:
<https://www.visualstudio.com/thank-you-downloading-visual-studio/?sku=community&rel=15>

Tutorial: <https://code.visualstudio.com/docs/other/dotnet>


##### MS VS2017 R Client Setup
<img alt="logo" height="28" src="https://halobi.com/wp-content/uploads/2016/08/r_logo.png" />

Download: <http://go.microsoft.com/fwlink/?LinkID=834568&clcid=1033>

Copy `SRO\_3.3.2.0\_1033.cab` to `C:\ProgramData\Microsoft\VisualStudio\Packages\Microsoft.R.Open.Exe,version=3.3.2.1026,chip=x64`

Re-run `RClientSetup.exe` in folder `Microsoft.R.Open.Exe,version=3.3.2.1026,chip=x64`  

### Nginx

Download: <http://nginx.org/download/nginx-1.13.4.zip> (Windows)  
Tutorial: <http://nginx.org/en/docs/windows.html>  
Discussion: <https://arstechnica.com/information-technology/2011/11/a-faster-web-server-ripping-out-apache-for-nginx/>  


```bash
start nginx

nginx -s stop	fast shutdown
nginx -s quit	graceful shutdown
nginx -s reload	changing configuration, starting new worker processes with a new configuration, graceful shutdown of old worker processes
nginx -s reopen	re-opening log files
```


```bash
cd c:\dev\php
php-cgi.exe -b 127.0.0.1:9000
```

### Eclipse

Install: https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/oxygen/R/eclipse-jee-oxygen-R-win32-x86_64.zip

Eclipse JEE Developers 64-Bit


### PHP 
<img alt="logo" height="28" src="https://upload.wikimedia.org/wikipedia/commons/2/27/PHP-logo.svg" />

VC14 x64 Thread Safe (2017-Jan-18 21:06:35)
<http://windows.php.net/downloads/releases/php-7.1.1-Win32-VC14-x64.zip>

Compatibility/Dependencies: Microsoft Visual C++ 2012 Redistributable (x64)

Installation:

Extract zip file
-	Add `;c:\dev\php` to environment variable `PATH`
-	Configure `php.ini`
-	`$HTTP_RAW_POST_DATA` is deprecated. Set:
   `always_populate_raw_post_data = -1`
-	Ensure `Apache httpd.conf` is configured for PHP:
 ```ini
AddHandler application/x-httpd-php .php
 AddType application/x-httpd-php .php .html
 LoadModule php7_module "c:/dev/php/php7apache2_4.dll"
 PHPIniDir "c:/dev/php" 
.
.
.
<IfModule dir_module>
    DirectoryIndex index.html
    DirectoryIndex index.php
</IfModule>
```


#### Composer

<https://getcomposer.org/download/> Tested: Composer-1.0.0

-	1.4.2 (2017-05-17)


Add `composer.phar` to project folder (folder where report is to be run from), 

At command line navigate to project folder. 

Run: 

```
> php composer.phar install
```


#### Pear
```
> wget http://pear.php.net/go-pear.phar
> php go-pear.phar
```

#### Zend Framework

(2017-02-07: Required only for Wikipedia api?)

Install: <https://framework.zend.com/downloads>

Tutorial: <https://framework.zend.com/learn>
-	(Can’t be installed behind proxy)

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsbash)</sup>

```
composer require zendframework/zendframework
composer require zendframework/zendpdf
composer require zendframework/zend-ldap
composer require zendframework/zend-json
composer require zendframework/zend-json-server
composer require zendframework/zend-authentication
composer require zendframework/zendservice-recaptcha * Requires JSON<2.5
```

#### Laravel
<b>Laravel 5.4</b>

Run in Bash (Cygwin)

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsbash)</sup>

```
composer global require "laravel/installer"
```



```
cd  C:\Dev\api\laravel_elastic_eric
composer install
php artisan serve --port=8014
```

<b>Alternatively, run on Vagrant VM (With VirtualBox)</b>

Tutorial: <https://laravel.com/docs/5.4/homestead>

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```
vagrant box add laravel/homestead
```

#### PECL Intl

For MediaWiki: The intl PECL extension is installed to handle Unicode normalization, falling back to slow pure-PHP implementation.
<http://pecl.php.net/package/intl>

Bundled?



### Python 3.4 

<img alt="logo" height="28" src="https://www.python.org/static/community_logos/python-logo-inkscape.svg" />


Install: https://www.python.org/ftp/python/3.4.3/python-3.4.3rc1.amd64.msi
-	c:\dev\python\python34


#### Pip-review 

Used to upgrade PIP installs

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```
> pip install pip-review
> pip-review --local --interactive
```

#### Virtualenv

Tutorial: https://virtualenv.pypa.io/en/latest/

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```
> pip install virtualenv
```

#### Python 2.7 (ElastAlert)

Install: https://www.python.org/ftp/python/2.7.9/python-2.7.9.msi
-	c:\dev\python\python27 

##### Pip-review 2.7 

Used to upgrade PIP installs

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

At CLI, note that full path is used as this version of Python is not references in the environment variables.

```bash
c:\dev\python\python27\Scripts\pip install pip-review
c:\dev\python\python27\Scripts\pip-review --local --interactive
```


### Ruby

#### Ruby 23-x64

Install: <https://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.3.3-x64.exe>  
Install path suggestion: `c:\dev\ruby\ruby23-x64`  

#### RubyGems 2.6.11

Install: <https://rubygems.org/rubygems/rubygems-2.6.11.zip>  
Install path suggestion: `c:\dev\ruby\rubygems-2.6.11`  

##### Bundler  
Environment Variables  
Add `;c:\dev\ruby\rubygems-2.6.11\bundler\lib` to System `PATH`  


#### JRuby 9.1.12.0

Install (Win 64 Exe): <https://s3.amazonaws.com/jruby.org/downloads/9.1.12.0/jruby_windows_x64_9_1_12_0.exe>   
Install path suggestion: `c:\dev\ruby\jruby-9.1.12.0`  


### Perl 
<img  alt="logo" height="28" src="http://www.douglasputnam.com/wp-content/uploads/2015/09/perl_logo_oreilly.jpg"/>

Install: http://strawberryperl.com/download/5.24.0.1/strawberry-perl-5.24.0.1-64bit.msi

<u>Note</u>: Administrator privileges required

#### cpanm

http://www.cpan.org/modules/INSTALL.html

```bash
cpan App::cpanminus
cpanm Spreadsheet::WriteExcel
cpanm Spreadsheet::ParseXLSX
```

If ‘force install’ is necessary:

```bash
cpan
cpan > force install Spreadsheet::ParseXLSX
```

### Scala 
<img src="https://ih0.redbubble.net/image.285146114.0897/flat,800x800,075,f.jpg" alt="logo" height="24"/>

To add a Scala ennvironment to Microsoft Visual Studio Code.


Editor for VSCode: <https://github.com/dragos/dragos-vscode-scala>  
Install from VSIX: <https://github.com/dragos/dragos-vscode-scala/releases>  
From Marketplace: <https://marketplace.visualstudio.com/items?itemName=dragos.scala-lsp>  


### Git

Tutorials:
- <https://help.github.com/articles/setting-your-username-in-git>  
- <https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line>  
- <http://stackoverflow.com/questions/8775850/how-do-i-add-files-and-folders-into-github-repos>  

Note: Git Bash opened from Git GUI, with repository ‘C:\Dev\elastic\projects\search’  

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsbash)</sup> (Linux CLI (e.g. MinTTY, MINGW64 (Git Bash)) 

Open Git bash

```bash
c:/dev/elastic/projects/search
git config --global user.name "MMeaney"
git status
git add README.md
git add public/*
git commit -m "First commit"
git remote add origin https://github.com/MMeaney/LEMASearch.git
git remote -v
git push origin master
```

To remove ‘origin’ (if desired to re-use)
```bash
git remote rm origin
```

To stage and push edited files:
```bash
git add .
git status
git push
```


If `git push` is not updating files in the remote repo, try:
```bash
git push origin master:master
```

#### Configure GIT Cert Path

```bash
git config --system http.sslcainfo "C:\dev\git\mingw64\ssl\certs\ca-bundle.crt" 
```

#### EGit (Git For Eclipse)
Install: <http://www.eclipse.org/egit/download/>  
Install (Eclipse 4.5 (Mars)): <http://download.eclipse.org/egit/updates-4.5>   


### Docker
Docker Toolkit for Windows: <https://docs.docker.com/toolbox/toolbox_install_windows/>  
Install: <https://download.docker.com/win/stable/DockerToolbox.exe>  
Tutorial: <https://hub.docker.com/_/hello-world/>  

#### boot2docker - Behind Corporate Proxy

Tutorial: <https://github.com/VonC/b2d>  

Set `HTTP_PROXY` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```bash
cd c:\dev\docker
git clone https://github.com/VonC/b2d.git
```

Edit `c:\dev\docker\env.bat`:

```bash
@echo off

rem minimal path:
set PATH=C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem

rem add Git to PATH
rem unzip Git from https://github.com/git-for-windows/git/releases
set GIT_HOME=c:\dev\git
set PATH=%PATH%;%GIT_HOME%\bin;%GIT_HOME%\usr\bin;%GIT_HOME%
set TERM=msys

rem add VirtualBox to PATH (https://www.virtualbox.org/)
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox\

rem add docker-machine to PATH (simple copy from https://github.com/docker/machine/releases)
set PATH=%PATH%;C:\Program Files\Docker Toolbox


rem Add boot2docker
set PATH=%PATH%;C:\Dev\docker\boot2docker


rem define proxy if needed
set HTTP_PROXY=http://<user>:<pwd>@proxy.company:80
set HTTPS_PROXY=http://<user>:<pwd>@proxy.company:80


set NO_PROXY=.cont,.company,.sock,localhost,127.0.0.1,::1,192.168.99.100,192.168.99.101,192.168.99.102,192.168.99.103,192.168.99.104,kv,blessed,staging,external

rem set thse variable to true to skip those machine creations
set SKIP_STAGING=
set SKIP_EXTERNAL=
```

At CLI, type `senv` to run `senv.bat`:

```bash
cd c:\dev\docker\b2d
senv.bat
```

If run successfully the final two lines of output at the CLI should be:
```bash
ok 'c:\dev\docker\b2d\'
"done"
```

You will then be returned to the command prompt. Type `b` to run `b.bat` to build all images

```bash
cd c:\dev\docker\b2d
b
```

#### Docker Cygwin
Launch Cygwin 

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsbash)</sup> (Linux CLI (e.g. MinTTY, MINGW64 (Git Bash))  

```bash
cd c:/progra~1/docker~1
*** (set proxies)
bash start.sh
```

![docker](https://user-images.githubusercontent.com/11856005/28163758-6076ff5a-67c4-11e7-94ea-a53cfac38e53.png)

```bash
$ [Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://username:password@proxy.host.ie:8888", [EnvironmentVariableTarget]::Machine)
$ [Environment]::SetEnvironmentVariable("HTTPS_PROXY", "https://username:password@proxy.host.ie:8888", [EnvironmentVariableTarget]::Machine)
$ docker pull hello-world
```


                      ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/ 





### Virtual Machines

#### Vagrant

Homepage: <https://www.vagrantup.com>  
Install: <https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2.msi?_ga=1.214299927.1694543487.1488877650>  

(Restart Required)

#### Oracle VM VirtualBox

Install: <http://download.virtualbox.org/virtualbox/5.1.14/VirtualBox-5.1.14-112924-Win.exe>  

Ensure `VT-x` is enabled in BIOS


<a target='_blank' href="https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/">How to Enable Intel VT-x in Your Computer's BIOS or UEFI Firmware</a>


### Cygwin

Tutorial: <https://hbase.apache.org/cygwin.html>  

Installed Cygwin 32-bit to C:\dev\cygwin

Environment Variables  
`CYGWIN_HOME`: `c:\dev\cygwin\`  
Add `;c:\dev\cygwin\bin` to `PATH`  
To set `JAVA_HOME` in Cygwin (bash prompt):

```bash
export JAVA_HOME="/cygdrive/c/Java/jre7u21"
```

To create a link to the Java JRE:
```bash
LN -s /cygdrive/c/Java/jre7u21 /usr/local/jre7u21
```

Once installed, run again to include SSH:  
HBase (and Hadoop) rely on <b>SSH</b> for interprocess/-node communication and launching remote commands. SSH will be provisioned on the target system via Cygwin, which supports running Cygwin programs as Windows services.


1.	Rerun the `setup.exe` utility.
2.	Leave all parameters as is, skipping through the wizard using the `Next` button until the `Select Packages` panel is shown.
3.	Maximize the window and click the `View` button to toggle to the list view, which is ordered alphabetically on `Package`, making it easier to find the packages needed.
4.	Select the following packages by clicking the status word (normally `Skip`) so it's marked for installation. Use the `Next` button to download and install the packages. 
    1. OpenSSH
    2. tcp_wrappers
    3. diffutils
    4. zlib
5.	Wait for the install to complete and finish the installation.

```bash
mkpasswd -l > /etc/passwd (mkpasswd -l -c > /etc/passwd?)
mkgroup -l -c > /etc/group
```



### NodeJS
Install: <https://nodejs.org/dist/v6.9.5/node-v6.9.5-x64.msi>  
-	C:\dev\nodejs


### React
GitHub: <https://facebook.github.io/react/>  
Tutorial: <https://facebook.github.io/react/tutorial/tutorial.html>  


Set NPM (Node Package Manager `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsnpm)</sup>

```bash
npm install -g react
```

### Wget 

https://sourceforge.net/projects/gnuwin32/files/wget/1.11.4-1/wget-1.11.4-1-bin.zip/download?use_mirror=netassist

-	Install folder `c:\dev\wget-1.11.4\`
-	Add `;c:\dev\wget-1.11.4\bin` to environment variable `PATH`



Example `wget` usage:

Launch Cygwin 

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsbash)</sup> (Linux CLI (e.g. MinTTY, MINGW64 (Git Bash))  

```
wget https://s3.amazonaws.com/apache-zeppelin/tutorial/bank/bank.csv --no-check-certificate
```

For [Apache Zeppelin](#apache-zeppelin-072) tutorial: Copied `bank.csv` to <a href target="_blank" href="http://maurice-vm.epa.ie/public/bank.csv">http://maurice-vm.epa.ie/public/bank.csv</a>


### HTTPie

Used for [REST API](#rest-api) design

Tutorial: <https://httpie.org>  
Github: <https://github.com/jkbrzt/httpie>  
Install: <https://httpie.org/#installation>  


Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```bash
pip install httpie
```



## Databases

### Hadoop 2.7.1
**Framework allowing for the distributed processing of large data sets across clusters of computers**

<img alt="logo" height="52" src="https://user-images.githubusercontent.com/11856005/28367883-63b94572-6c8a-11e7-8006-83f5ac306bc7.png" />


Install: <http://archive.apache.org/dist/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz>  

Environment Variables:
-	Add `;c:\dev\hadoop\hadoop-2.7.1\bin` to environment variable `PATH`
-	Add `;c:\dev\hadoop\hadoop-2.7.1\sbin` to environment variable `PATH`
-	Create new environment variable `HADOOP_HOME`, set to `c:\dev\hadoop\hadoop-2.7.1`

Create the folders `c:\dev\hadoop\hadoop-2.7.1\data\namenode` and `c:\dev\hadoop\hadoop-2.7.1\data\datanode` if they don't exist:

```bash
cd c:\dev\hadoop\hadoop-2.7.1
md data\namenode data\datanode
```


Create the folders `c:\dev\hadoop\hadoop-2.7.1\tmp\dfs\name\data` if they don't exist:

```bash
cd c:\dev\hadoop\hadoop-2.7.1
md tmp\dfs\name\data
```

Edit `c:\dev\hadoop\hadoop-2.7.1\etc\hadoop\hdfs-site.xml`

```xml
<configuration>

	<property>
		<name>dfs.replication</name>
		<value>1</value>
	</property>

	<property>
		<name>dfs.namenode.name.dir</name>
		<value>file:/dev/hadoop/hadoop-2.7.1/data/namenode</value>
	</property>

	<property>
		<name>dfs.datanode.data.dir</name>
		<value>file:/dev/hadoop/hadoop-2.7.1/data/datanode</value>
	</property>

	<property>
		<name>dfs.data.dir</name>
		<value>file:/dev/hadoop/hadoop-2.7.1/tmp/dfs/name/data</value> 
		<final>true</final> 
		</property> 
		<property> 
		<name>dfs.name.dir</name>
		<value>file:/dev/hadoop/hadoop-2.7.1/tmp/dfs/name</value> 
		<final>true</final> 
	</property>

</configuration>
```


Edit `c:\dev\hadoop\hadoop-2.7.1\etc\hadoop\hadoop-env.cmd`:
-	Ensure `JAVA_HOME` matches current `JAVA_HOME` environment variable, e.g.

```
set JAVA_HOME=c:\java\jdk1.8.0_131
```

![hadoop-env.cmd](https://user-images.githubusercontent.com/11856005/28206685-c7dfd06c-687e-11e7-942b-dccadb27931b.png)

To run:

```bash
cd c:\dev\hadoop\hadoop-2.7.1\sbin
start-dfs.cmd
start-yarn.cmd
```

To run (deprecated):

```bash
cd c:\dev\hadoop\hadoop-2.7.1\sbin
start-all.cmd
```

To test YARN:
```bash
c:\dev\hadoop\hadoop-2.7.1\bin\yarn jar c:\dev\hadoop\hadoop-2.7.1\share\hadoop\mapreduce\hadoop-mapreduce-examples-2.7.1.jar wordcount file:/dev/hadoop/hadoop-2.7.1/LICENSE.txt /out
```

**Troubleshooting**

To format NameNodes

```bash
cd c:\dev\hadoop\hadoop-2.7.1\bin
hdfs namenode -format
```

Edit `c:\dev\hadoop\hadoop-2.7.1\etc\hadoop\core-site.xml` if there are binding issues on NameNode.
- NameNode default binds to port 9000, which is used by Eclipse for testing. So the conf file can be edited to use port 9001

```xml
<configuration>

   <property>
       <name>fs.defaultFS</name>
       <value>hdfs://localhost:9001</value>
   </property>
   
</configuration>
```




#### Apache HBase 1.30

Install: <http://archive.apache.org/dist/hbase/1.3.0/hbase-1.3.0-bin.tar.gz>  
Tutorial: 

Environment Variables:
-	Add `;c:\dev\apache\hbase-1.3.0\bin` to environment variable `PATH`
-	Create new environment variable `HBASE_HOME`, set to `c:\dev\apache\hbase-1.3.0`


Edit config `c:\dev\apache\hbase-1.3.0\conf\hbase-site.xml`  
```xml
<configuration>
  <property>
    <name>hbase.rootdir</name>
    <value>file:/Dev/Hadoop/hadoop-2.7.1/data/datanode</value>
  </property>
  <property>
    <name>hbase.cluster.distributed</name>
    <value>false</value>
  </property>
</configuration>
```


### Apache Hive 2.0.1
**Data warehouse software facilitating reading, writing, and managing large datasets residing in distributed storage using SQL**

<img alt="logo" src="https://hive.apache.org/images/hive_logo_medium.jpg" />

Home: <https://hive.apache.org/>   
Install: <http://archive.apache.org/dist/hive/hive-2.0.1/apache-hive-2.0.1-bin.tar.gz>   
Tutorial: <http://www.zymr.com/hive-installation-windows-7/>   

From [Wikipedia](https://en.wikipedia.org/wiki/Apache_Hive):
> Apache Hive supports analysis of large datasets stored in Hadoop's HDFS and compatible file systems such as Amazon S3 filesystem. It provides an SQL-like query language called HiveQ


Environment Variables:
-	Add `;c:\dev\apache\hive-2.0.1\bin` to environment variable `PATH`
-	Create new environment variable `HIVE_HOME`, set to `c:\dev\apache\hive-2.0.1`
-	Create new environment variable `CLASSPATH` if requtred, set to (or append) `;c:\dev\apache\hive-2.0.1\lib` and `;c:\dev\hadoop\hadoop-2.7.1\share\hadoop\common\lib`

Install [MySQL](#mysql)
 
Download MySQL Java Connector (5.0.8): <https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.0.8.tar.gz>
- Extract `mysql-connector-java-5.0.8-bin.jar`
- Copy jar to `c:\dev\apache\hive-2.0.1\lib`

Open `MySQL 5.7 Command Line Client`

![image](https://user-images.githubusercontent.com/11856005/28371018-b1d0c768-6c93-11e7-8918-8ee29ad56c94.png)

```bash
Enter password:
mysql> CREATE DATABASE metastore_db;

mysql> CREATE USER 'hiveuser'@'%' IDENTIFIED BY 'hivepassword';
mysql> GRANT all on *.* to 'hiveuser'@localhost identified by 'hivepassword';

mysql> flush privileges;
```

Add the following to `c:\dev\apache\hive-2.0.1\conf\hive-default.xml`

```xml
  <property>
    <name>javax.jdo.option.ConnectionURL</name>
    <value>jdbc:mysql://localhost:3306/metastore_db?createDatabaseIfNotExist=true</value>
    <description>metadata is stored in a MySQL server</description>
  </property>

  <property>
    <name>javax.jdo.option.ConnectionDriverName</name>
    <value>com.mysql.jdbc.Driver</value>
    <description>MySQL JDBC driver class</description>
</property>

  <property>
    <name>javax.jdo.option.ConnectionUserName</name>
    <value>userhive</value>
    <description>user name for connecting to mysql server </description>
</property>

  <property>
    <name>javax.jdo.option.ConnectionPassword</name>
    <value>hivepwd</value>
    <description>password for connecting to mysql server </description>
  </property>

  <property>
    <name>hive.metastore.uris</name>
    <value>thrift://<IP address of your host>:9083</value>
    <description>Thrift URI for the remote metastore. Used by metastore client to connect to remote metastore.</description>
  </property>
```



Metastore schema ???:
```bash
cd c:\dev\apache\hive-2.0.1\bin
hive --service schematool -initSchema -dbType derby
```

If Hive is run accidentally before Metastore initilisation:
```bash
cd c:\dev\apache\hive-2.0.1\bin
mv metastore_db metastore_db.tmp
hive --service schematool -initSchema -dbType derby
```
Ref: 
<https://stackoverflow.com/questions/35655306/hive-installation-issues-hive-metastore-database-is-not-initialized>

Run Hive:
```bash
cd c:\dev\apache\hive-2.0.1\bin
hive
```


### Apache Drill 1.10
**Distributed MPP Query Layer (Massively Parallel Processing Database) supporting SQL against NoSQL and Hadoop storage**

<img alt="logo" height="52" src="https://user-images.githubusercontent.com/11856005/28360044-30248c44-6c6c-11e7-91bc-f059af72124a.png" />

Tutorial: <https://github.com/apache/drill/blob/master/INSTALL.md>   
Install: <https://github.com/apache/drill.git>


From [Wikipedia](https://en.wikipedia.org/wiki/Apache_Drill):
> Apache Drill is an open-source software framework that supports data-intensive distributed applications for interactive analysis of large-scale datasets. Drill is the open source version of Google's Dremel system which is available as an infrastructure service called Google BigQuery. One explicitly stated design goal is that Drill is able to scale to 10,000 servers or more and to be able to process petabytes of data and trillions of records in seconds. Drill is an Apache top-level project.

> Drill supports a variety of NoSQL databases and file systems, including HBase, MongoDB, MapR-DB, HDFS, MapR-FS, Amazon S3, Azure Blob Storage, Google Cloud Storage, Swift, NAS and local files. A single query can join data from multiple datastores. For example, you can join a user profile collection in MongoDB with a directory of event logs in Hadoop.



Note: Switch `-DskipTests` used due to build failure  
- Ref: <https://issues.apache.org/jira/browse/DRILL-3264>)
```
git clone https://github.com/apache/drill.git
cd drill
mvn clean install -DskipTests
md opt\drill
cd opt\drill
```

Copy the contents of the folder `c:\dev\apache\drill\distribution\target\apache-drill-1.11.0-SNAPSHOT` to `c:\dev\apache\drill\opt\drill`

![image](https://user-images.githubusercontent.com/11856005/28361499-e121dfa2-6c70-11e7-9b0f-7f9a3662de65.png)


Environment Variables:
-	Add `;c:\dev\apache\drill\opt\drill\bin` to environment variable `PATH`
-	Create new environment variable `DRILL_HOME`, set to `c:\dev\apache\drill\opt\drill\`


```
cd c:\dev\apache\drill\opt\drill\bin
sqlline -u jdbc:drill:zk=local -n admin -p admin
```


### MySQL 
MySQL Installer 5.7.17  
Filename: `mysql-installer-community-5.7.17.0.msi`  
Install: <https://dev.mysql.com/get/archives/mysql-installer/mysql-installer-community-5.7.17.0.msi>  

MySQL Workbench  
Filename: `mysql-workbench-community-6.3.9-winx64.msi`  
Install: <https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.9-winx64.msi>   

![msql_conn](https://user-images.githubusercontent.com/11856005/28163772-67717984-67c4-11e7-9acf-bb3e0c745a3b.png)

![mysqlport](https://user-images.githubusercontent.com/11856005/28163773-6a2c8966-67c4-11e7-86ad-6ae65f869395.png)


### MongoDB
Install: <https://www.mongodb.com/download-center?jmp=nav#community>  
Install path `c:\dev\MongoDB`  
Filename: `mongodb-win32-x86_64-2008plus-ssl-3.4.2-signed.msi`  

Tutorial: <https://www.tutorialspoint.com/mongodb/mongodb_environment.htm>  

Open CLI 1:
```
cd c:\dev\MongoDB\Server\3.4\bin
mongod.exe --dbpath "c:\dev\MongoDB\Data"
```
Open CLI 2 
```
cd c:\dev\MongoDB\Server\3.4\bin
mongo
```

#### RoboMongo UI
Install: <https://download.robomongo.org/1.0.0-rc1/windows/robomongo-1.0.0-rc1-windows-x86_64-496f5c2.exe>  
In the ‘MongoDB Connections’ dialogue box click ‘Create’ in the top left.  
In the ‘Connection Settings’ dialogue box type a name (e.g. ‘localhost’ or ‘localhost:27017’) and enter the address and port (e.g. ‘localhost’ and ‘27017’) and save.  
In the ‘MongoDB Connections’ dialogue box select new connection and click ‘Connect’  

##### MongoDB Delete
```
db.measurements.remove( {'_id': ObjectId("58f88808c864b17558000001")} );
```
```
db.measurements.createIndex( { "measurementid": 1 }, { unique: true } )
```
### Postgres 9.6.2
Install: <http://oscg-downloads.s3.amazonaws.com/packages/PostgreSQL-9.6.2-2-win64-bigsql.exe>  
Admin: <http://localhost:8051/#/>  
Tutorial: <https://wiki.postgresql.org/wiki/Running_%26_Installing_PostgreSQL_On_Native_Windows>  
Tutorial: <https://www.youtube.com/watch?v=-f9lke78g2U>  


Super User: postgres + password  
Port: 5432  
Locale: English, Ireland  
Run “pgAdmin3 LTS by BigSQL” (GUI from Start Menu)  

![pgadmin3](https://user-images.githubusercontent.com/11856005/28210840-748008c0-6891-11e7-8b1a-47241d02a4e8.png)


#### PostgreSQL 9.3 (Deprecated) 
Install: <http://get.enterprisedb.com/postgresql/postgresql-9.3.13-1-windows-x64-binaries.zip>  
Install: <http://get.enterprisedb.com/postgresql/postgresql-9.3.13-1-windows-x64.exe>  
Tutorial: <http://www.petrikainulainen.net/programming/tips-and-tricks/installing-postgresql-9-1-to-windows-7-from-the-binary-zip-distribution/>  

Extract to `c:\dev\pgsql`

Create folders:
-	c:\dev\pgsql\data
-	c:\dev\pgsql\log

Command prompt:
```bash
cd C:\Dev\pgsql\bin
initdb -U postgres -A password -E utf8 -W -D c:\dev\pgsql\data
```

Super user: postgres
Note: Usual password

```bash
"c:\dev\pgsql\bin\pg_ctl" -D "c:\dev\pgsql\data" -l 
"c:\dev\pgsql\log\pgsql.log" start
```
or
```bash
"postgres" -D "c:\dev\pgsql\data"
```
or
```bash
"pg_ctl" -D "c:\dev\pgsql\data" -l logfile start
```




## Apache

### Apache HTTPD Server 2.4 Binary Win64

Install: <http://de.apachehaus.com/downloads/httpd-2.4.25-x64-vc14-r1.zip>  
Download Links: <http://www.apachehaus.com/cgi-bin/download.plx>


### Apache Maven 3.3.9
Install: http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip  
Tar: http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz  
Tutorial: https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html  
Proxy Tutorial: https://www.mkyong.com/maven/how-to-enable-proxy-setting-in-maven/  


Edit `c:\dev\apache\maven-3.3.9\conf\settings.xml`:

Around line 105:
```xml
   <proxy>
      <active>true</active>
      <protocol>http</protocol>
      <username>username</username>
      <password>***PASSWORD***</password>
      <host>proxy.host.ie</host>
      <port>8888</port>
    </proxy>
  </proxies>
```
CD to project folder
```
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false 
```
CD to project folder
```
mvn archetype:generate -DgroupId=fr.pilato.elasticsearch.crawler -DartifactId=fscrawler-2.1 -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false 
```


### Apache Ant 1.9.7 
To build non-binary Nutch 2.3
Install: <http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.7-bin.zip>   
Tutorial: <http://www.mkyong.com/ant/how-to-install-apache-ant-on-windows/>  


### Apache Tika 1.15
Install: <http://archive.apache.org/dist/tika/tika-app-1.15.jar>   
Tutorial: <http://www.tutorialspoint.com/tika/tika_environment.htm>  

Note Current snapshot (1.16) Github

Add the following to `c:\dev\tika\tika-master\tika-app\pom.xml`
```xml
   <dependency>
      <groupId>${project.groupId}</groupId>
      <artifactId>tika-dl</artifactId>
      <version>${project.version}</version>
    </dependency>
```

To build snapshot with Maven, open CLI:
```bash
cd c:\dev\tika\tika-master\tika-app
mvn clean install
```

##### Tika JAR recompile (deprecated)
(Build with Maven instead)
To recompile jar:
Assuming the files from the decompiled jar are located at `c:\dev\tika\tika-app-1.14a`

At CLI
```bash
cd c:\dev\tika.
jar cvf tika-app-1.14a.jar tika-app-1.14a
```

This will create `tika-app-1.14a.jar`. After testing this can be renamed to `tika-app-1.14.jar` and moved to `FSCrawler` jar library.


Source (1.14): <http://archive.apache.org/dist/tika/tika-1.14-src.zip>  

Others:  
<http://www.apache.org/dyn/closer.cgi/tika/tika-1.12-src.zip>  
<http://www.apache.org/dyn/closer.cgi/tika/tika-app-1.12.jar>  




### Apache Zookeeper 3.4.6
Install: <http://ftp.heanet.ie/mirrors/www.apache.org/dist/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz>  
Tutorial:
<https://support.lucidworks.com/hc/en-us/articles/203187153-Install-and-start-Zookeeper-server-on-Windows>  
Tutorial: <https://zookeeper.apache.org/doc/r3.4.9/zookeeperStarted.html>  

```bash
cd c:\dev\apache\zookeeper-3.4.9\bin
zkServer.cmd
```
To test open another CLI and type:
```bash
cd c:\dev\apache\zookeeper-3.4.9\bin
zkCli -server 127.0.0.1:2181
```

This should open a command line like `[zk: 127.0.0.1:2181(CONNECTED) 0]`

Create a test node at the `zk` prompt:
```bash
[zk: 127.0.0.1:2181(CONNECTED) 0] create /zk_test my_data
```


### Apache Kafka 0.10.1.1
Install: <http://archive.apache.org/dist/kafka/0.11.0.0/kafka_2.11-0.11.0.0.tgz>  
Docs: <http://ftp.heanet.ie/mirrors/www.apache.org/dist/kafka/0.10.1.1/kafka_2.11-0.10.1.1-site-docs.tgz>  
Tutorial: https://www.codeproject.com/Articles/1068998/Running-Apache-Kafka-on-Windows-without-Cygwin  
Examples: https://mapr.com/blog/getting-started-sample-programs-apache-kafka-09/ (Cygwin)  

```
C:\Dev\apache\kafka_2.11-0.10.1.1\config\server.properties
log.dirs=C:/dev/apache/kafka_2.11-0.10.1.1/kafka-logs
```
  
Open three command prompts at `c:\dev\apache\kafka_2.11-0.10.1.1\bin\windows`

```
kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```

```
kafka-console-producer.bat --broker-list localhost:9092 --topic test
```


```
kafka-console-consumer.bat --zookeeper localhost:2181 --topic test
```

### Apache Spark

#### Apache Spark 1.6.3
Install: <http://archive.apache.org/dist/spark/spark-1.6.3/spark-1.6.3-bin-hadoop2.6.tgz>  

#### Apache Spark 2.0.0
Install: <http://archive.apache.org/dist/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.7.tgz>  

#### Apache Spark 2.1.0
Install: <http://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz> 

- All chosen Spark versions pre-built for Hadoop 2.7
- Spark 1.6.3 chosen for `SQLContext` compatibility with Machine Learning examples


Tutorial: <http://www.kdnuggets.com/2015/11/petrov-apache-spark-machine-learning-large-data.html>  
- `Scala` examples from the above tutorial are collected in this file: [_all.scala](_all.scala)

Tutorial: <https://blogs.msdn.microsoft.com/bigdatasupport/2015/10/22/how-to-allow-spark-to-access-microsoft-sql-server/>

Environment Variables:
-	Add `;c:\dev\apache\spark-1.6.3\bin` to environment variable `PATH`
-	Create new environment variable `SPARK_HOME`, set to `c:\dev\apache\spark-1.6.3` to 

Configuration:
- Edit `c:\dev\apache\spark-1.6.3\conf\spark-defaults.conf`
- Add or edit the following lines:
```
spark.driver.extraClasspath	 c:\\dev\\jdbc_driver_library\\sqljdbc_4.2\\enu\\sqljdbc42.jar
spark.executor.extraClasspath	 c:\\dev\\jdbc_driver_library\\sqljdbc_4.2\\enu\\sqljdbc42.jar
```

To run at <abbr title="Command Line Interface">CLI</abbr>:
```bash
cd c:\dev\apache\spark-1.6.3\bin
spark-shell.cmd --master local[2] 
:load _all.scala
```

Spark UI: <http://localhost:4040/jobs/> or <http://localhost:4041/jobs/>

(Note the output at the CLI, the port binding may have to cycle through port numbers, e.g. 4040, 4041, 4042, 4043, etc.

![spark_ui_bindings](https://user-images.githubusercontent.com/11856005/28317127-9797ff6e-6bbd-11e7-97bd-c2e1e2335f06.png)




Discussion: <http://www.kdnuggets.com/2015/08/big-data-question-hadoop-spark.html>


### Apache Mahout 0.12.2
Install: <http://archive.apache.org/dist/mahout/0.12.2/apache-mahout-distribution-0.12.2.zip>  
Tutorial: <http://www.alansaid.com/mahout-on-hadoop-in-cygwin/>  
Tutorial: <http://solaimurugan.blogspot.ie/2015/08/installing-mahout-with-apache-spark-141.html>  


Environment Variables:
-	Add `;c:\dev\apache\mahout-0.12.2\bin` to environment variable `PATH`
-	Create new environment variable `MAHOUT_HOME`, set to `c:\dev\apache\mahout-0.12.2\`

Launch Cygwin
```
cd c:\dev\apache\mahout-0.12.2
$ export MAHOUT_LOCAL=true
```


### Apache Zeppelin 0.7.2
Install: http://archive.apache.org/dist/zeppelin/zeppelin-0.7.2/zeppelin-0.7.2-bin-all.tgz  
Tutorial: https://zeppelin.apache.org/docs/0.7.2/install/install.html  

Launch Zeppelin
- Ensure that the ‘`webapp`’ folder rights are not set to read-only. 
- Sample folder path: c:\dev\apache\zeppelin\zeppelin-0.7.2-bin-all\webapps\webapp

```
cd c:\dev\apache\zeppelin\zeppelin-0.7.2-bin-all\bin
zeppelin.cmd
```

<a href target="_blank" href="http://localhost:8080/#/notebook/2A94M5J1Z">http://localhost:8080/#/notebook/2A94M5J1Z</a>


Copied bank.csv to <a href target="_blank" href="http://maurice-vm.epa.ie/public/bank.csv">http://maurice-vm.epa.ie/public/bank.csv</a>


### Apache Nutch
<img src="http://nutch.apache.org/assets/img/nutch_logo_tm.png" alt="logo" height="24"/>


Home: <http://nutch.apache.org/>

#### Apache Nutch 1.1 

Install: https://www.apache.org/dist/nutch/1.11/apache-nutch-1.11-bin.zip  
Place extracted folder in `%Cygwin_Home%`:
- `c:\dev\cygwin\usr\local\bin\nutch-1.11`


Environment Variables:
-	Add `;c:\dev\cygwin\usr\local\bin\nutch-1.11\bin` to environment variable `PATH`
-	Create new environment variable `NUTCH_HOME`, set to `c:\dev\cygwin\usr\local\bin\nutch-1.11`
-	Create new environment variable `NUTCH_JAVA_HOME`, set to `C:\Java\jdk1.8.0_131`

<img src="https://user-images.githubusercontent.com/11856005/28163800-81556932-67c4-11e7-8f84-7d67ccc88af4.png"/>


Tutorials:
- <a target="_blank" href="https://www.mind-it.info/2013/09/26/integrating-nutch-1-7-elasticsearch/">https://www.mind-it.info/2013/09/26/integrating-nutch-1-7-elasticsearch/</a>
- <a target="_blank" href="https://wiki.apache.org/nutch/NutchTutorial">https://wiki.apache.org/nutch/NutchTutorial</a>
- <a target="_blank" href="https://javaarchitectforum.com/2015/08/30/crawl-and-index-nutch-elasticsearch-partners-in-the-making">https://javaarchitectforum.com/2015/08/30/crawl-and-index-nutch-elasticsearch-partners-in-the-making</a>
- <a target="_blank" href="https://qbox.io/blog/scraping-the-web-with-nutch-for-elasticsearch">https://qbox.io/blog/scraping-the-web-with-nutch-for-elasticsearch</a>

Edit configuration (`c:\dev\cygwin\home\nutch-1.11\conf\nutch-site.xml`):

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<!-- Put site-specific property overrides in this file. -->

<configuration>

<property>
  <name>plugin.includes</name>
  <value>protocol-http|urlfilter-regex|parse-(html|tika)|index-(basic|anchor)|indexer-elastic|scoring-opic|urlnormalizer-(pass|regex|basic)</value>
  <description>Regular expression naming plugin directory names to
  include.  Any plugin not matching this expression is excluded.
  In any case you need at least include the nutch-extensionpoints plugin. By
  default Nutch includes crawling just HTML and plain text via HTTP,
  and basic indexing and search plugins. In order to use HTTPS please enable
  protocol-httpclient, but be aware of possible intermittent problems with the
  underlying commons-httpclient library.
  </description>
</property>

<!-- Elasticsearch properties -->

<property>
  <name>elastic.host</name>
  <value>localhost</value>
  <description>The hostname to send documents to using TransportClient. Either host
  and port must be defined or cluster.</description>
</property>

<property>
  <name>elastic.port</name>
  <value>9300</value>
  <description>
  </description>
</property>

<property>
  <name>elastic.cluster</name>
  <value>MMCluster</value>
  <description>The cluster name to discover. Either host and potr must be defined
  or cluster.</description>
</property>

<property>
  <name>elastic.index</name>
  <value>nutch</value>
  <description>Default index to send documents to.</description>
</property>

<property>
  <name>elastic.max.bulk.docs</name>
  <value>250</value>
  <description>Maximum size of the bulk in number of documents.</description>
</property>

<property>
  <name>elastic.max.bulk.size</name>
  <value>2500500</value>
  <description>Maximum size of the bulk in bytes.</description>
</property>

</configuration>
```

##### Create URL List to Crawl
`c:\dev\cygwin\home\nutch-1.11\bin\urls\seed.txt`

<img src="https://user-images.githubusercontent.com/11856005/28163732-4d3d2342-67c4-11e7-9699-3fe6a98aae28.png"/>


Launch Cygwin and navigate to Nutch bin folder

```
cd c:/dev/cygwin/usr/local/bin/nutch-1.11
bin/crawl --index ~/urls/seed.txt ~/TestCrawl -1
bin/crawl --index ~/seeds/seed.txt ~/TestCrawl -1
```

#### Apache Nutch 1.3
Install: https://www.apache.org/dist/nutch/1.13/apache-nutch-1.13-bin.zip  
Place extracted folder in `%Cygwin_Home%`:
- `c:\dev\cygwin\usr\local\bin\nutch-1.13`


Environment Variables:
-	Add `;c:\dev\cygwin\usr\local\bin\nutch-1.13\bin` to environment variable `PATH`
-	Create new environment variable `NUTCH_HOME`, set to `c:\dev\cygwin\usr\local\bin\nutch-1.13`
-	Create new environment variable `NUTCH_JAVA_HOME`, set to `C:\Java\jdk1.8.0_131`

Tutorials:
- <a target="_blank" href="https://wiki.apache.org/nutch/NutchTutorial">https://wiki.apache.org/nutch/NutchTutorial</a>

Edit configuration to name the crawler (`c:\dev\cygwin\home\nutch-1.13\conf\nutch-site.xml`):

![nutch-default.xml](https://user-images.githubusercontent.com/11856005/28168777-142e4e6e-67d8-11e7-8b5b-9492dffe224c.png)


```xml
...
<!-- HTTP properties -->

<property>
  <name>http.agent.name</name>
  <value>Test</value>
  ...
```

Launch Cygwin and navigate to Nutch folder `c:/dev/cygwin/usr/local/bin/nutch-1.13/`

```
cd c:/dev/cygwin/usr/local/bin/nutch-1.13
bin/nutch inject crawl/crawldb urls/seed.txt
```

##### Create URL List to Crawl
`c:\dev\cygwin\usr\local\bin\nutch-1.13\urls\seed.txt`

Values: `http://nutch.apache.org/`

![seeds.txt](https://user-images.githubusercontent.com/11856005/28168591-7d454d40-67d7-11e7-9295-a02867d5f024.png)



Nutch Tutorial: <http://lucene.472066.n3.nabble.com/nutch-1-12-windows-UnsatisfiedLinkError-exception-while-running-inject-command-td4290739.html>  
Check: `C:\Dev\cygwin\usr\local\bin\nutch-1.13\lib\native\README.txt`  
Copy


##### HBase Nutch Config
Edit config `c:\dev\cygwin\usr\local\bin\nutch-1.13\conf\hbase-site.xml`  
Edit config `c:\dev\apache\hbase-1.3.0\conf\hbase-site.xml'  
```xml
<configuration>
  <property>
    <name>hbase.rootdir</name>
    <value>file:/Dev/Hadoop/hadoop-2.7.1/data/datanode</value>
  </property>
  <property>
    <name>hbase.cluster.distributed</name>
    <value>false</value>
  </property>
</configuration>
```


2017-07-14: On hold to focus on Zeppelin. Apparent Hadoop/HBASE-related issues (screenshot below)

![Nutch 1.13 Hadoop](https://user-images.githubusercontent.com/11856005/28205831-9bb18060-687b-11e7-820d-ff0794d4f657.png)


#### Apache Nutch 2.3 
(Upgrade if binary released, or build with Ant)
Install: <a target="_blank" href="http://www.apache.org/dyn/closer.lua/nutch/2.3.1/apache-nutch-2.3.1-src.tar.gz">http://www.apache.org/dyn/closer.lua/nutch/2.3.1/apache-nutch-2.3.1-src.tar.gz</a>  

Install: <a target='_blank' href="http://archive.apache.org/dist/nutch/2.3.1/">http://archive.apache.org/dist/nutch/2.3.1/</a>  

Edit `c:\dev\apache\nutch-2.3.1\conf\gora.properties`
```
gora.datastore.default=org.apache.gora.hbase.store.HBaseStore
```

Edit `c:\dev\elastic\nutch-2.3.1\conf\nutch-site.xml`

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!-- Put site-specific property overrides in this file. -->
<configuration>
 <property>
    <name>http.agent.name</name>
    <value>Test</value>
  </property>
  <property>
    <name>storage.data.store.class</name>
    <value>org.apache.gora.hbase.store.HBaseStore</value>
    <description>Default class for storing data</description>
  </property>
  <property>
    <name>plugin.includes</name>     
    <value>protocol-httpclient|urlfilter-regex|parse-(text|tika|js)|index-(basic|anchor)|query-(basic|site|url)|response-(json|xml)|summary-basic|scoring-opic|urlnormalizer-(pass|regex|basic)|indexer-elastic</value>
  </property>
  <property>
    <name>db.ignore.external.links</name>
    <value>true</value>
  </property>
  <property>
    <name>elastic.host</name>
    <value>localhost</value>
  </property>
  <property>
    <name>elastic.port</name>
    <value>9300</value>
  </property>
  <property>
    <name>elastic.cluster</name>
    <value>MMCLuster</value>
  </property>
  <property>
    <name>elastic.index</name>
    <value>nutchindexAAA</value>
  </property>
  <property>
    <name>parser.character.encoding.default</name>
    <value>utf-8</value>
  </property>
  <property>
    <name>http.content.limit</name>
    <value>6553600</value>
  </property>
  <property>
  <name>elastic.max.bulk.docs</name>
  <value>250</value>
  <description>Maximum size of the bulk in number of documents.</description>
</property>
<property>
  <name>elastic.max.bulk.size</name>
  <value>2500500</value>
  <description>Maximum size of the bulk in bytes.</description>
</property>
</configuration>
```

Edit `c:\dev\apache\nutch-2.3.1\ivy\ivysettings.xml`
```
abc
```

Edit `c:\dev\apache\nutch-2.3.1\ivy\ivy.xml`

```xml
<ivy-module version="1.0">
	<info organisation="org.apache.nutch" module="nutch">
		<license name="Apache 2.0" url="http://www.apache.org/licenses/LICENSE-2.0.txt/"/>
		<ivyauthor name="Apache Nutch Team" url="http://nutch.apache.org" />
		<description homepage="http://nutch.apache.org">Nutch is an open source web-search software. It builds on 
		Hadoop, Tika and Solr, adding web-specifics, such as a crawler, a link-graph database etc.
		</description>
	</info>

	<configurations>
		<include file="${basedir}/ivy/ivy-configurations.xml" />
	</configurations>

	<publications>
		<!--get the artifact from our module name -->
		<artifact conf="master" />
	</publications>

	<dependencies>
	    <!-- **** Required dependency for elastic search client and api 
	    (additional repo added in ivysettings) (can be removed if elasticsearch is not needed **** -->
	    <dependency org="org.elasticsearch" name="elasticsearch" rev="0.18.3" 
	    	conf="*->default"/>
		
		<!-- **** Required dependency for mongodb java driver (can be removed if mongodb is not needed) -->
	    <dependency org="org.mongodb" name="mongo-java-driver" rev="2.7.1"
			conf="*->default"/>
			
		<dependency org="org.apache.solr" name="solr-solrj" rev="3.1.0"
			conf="*->default"/>
		<dependency org="org.slf4j" name="slf4j-log4j12" rev="1.5.5" conf="*->master" />

		<dependency org="commons-logging" name="commons-logging"
			rev="1.0.4" conf="*->master" />
		<dependency org="commons-logging" name="commons-logging-api"
			rev="1.0.4" conf="*->master" />

		<dependency org="commons-lang" name="commons-lang" rev="2.4"
			conf="*->default" />
		<dependency org="commons-collections" name="commons-collections"
			rev="3.1" conf="*->default" />
		<dependency org="commons-httpclient" name="commons-httpclient"
			rev="3.1" conf="*->master" />
		<dependency org="commons-codec" name="commons-codec" rev="1.3"
			conf="*->default" />

		<dependency org="org.apache.hadoop" name="hadoop-core" rev="0.20.2"
			conf="*->default">
			<exclude org="hsqldb" name="hsqldb" />
			<exclude org="net.sf.kosmosfs" name="kfs" />
			<exclude org="net.java.dev.jets3t" name="jets3t" />
			<exclude org="org.eclipse.jdt" name="core" />
			<exclude org="org.mortbay.jetty" name="jsp-*" />
			<exclude org="ant" name="ant" />
		</dependency>

		<dependency org="com.ibm.icu" name="icu4j" rev="4.0.1" />
		<dependency org="org.apache.tika" name="tika-core" rev="0.9" />
		<dependency org="org.mortbay.jetty" name="jetty-client" rev="6.1.22" />

		<dependency org="log4j" name="log4j" rev="1.2.15" conf="*->master" />

		<dependency org="xerces" name="xercesImpl" rev="2.9.1" />
		<dependency org="xerces" name="xmlParserAPIs" rev="2.6.2" />
		<dependency org="oro" name="oro" rev="2.0.8" />

		<!--Configuration: test -->

		<!--artifacts needed for testing -->
		<dependency org="junit" name="junit" rev="3.8.1" conf="test->default" />
		<dependency org="org.apache.hadoop" name="hadoop-test" rev="0.20.2"
			conf="test->default" />

		<dependency org="org.mortbay.jetty" name="jetty" rev="6.1.22"
			conf="test->default" />
		<dependency org="org.mortbay.jetty" name="jetty-util" rev="6.1.22"
			conf="test->default" />

                <!--global exclusion-->
             	<exclude module="jmxtools" />
             	<exclude module="jms" />
             	<exclude module="jmxri" />
	</dependencies>
</ivy-module>
```

Build Nutch at CLI
```bash
cd c:\dev\apache\nutch-2.3.1
ant runtime
```




### Apache OFBiz 16.11.01
About: <a href target="_blank" href="https://ofbiz.apache.org/">https://ofbiz.apache.org/</a>  

Open-source:
-	ERP (Enterprise Resource Planning)
-	CRM (Customer Relationship Management)
-	CMS (Content Management System)
-	E-Business / E-Commerce, SCM (Supply Chain Management), MRP (Manufacturing Resource Planning), MMS/EAM (Maintenance Management System/Enterprise Asset Management).

Install: http://archive.apache.org/dist/ofbiz/apache-ofbiz-16.11.01.zip  
Tutorial: https://cwiki.apache.org/confluence/display/OFBIZ/Demo+and+Test+Setup+Guide  

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsbash)</sup> (Linux CLI (e.g. MinTTY, MINGW64 (Git Bash))  

```
gradlew -Dhttp.proxyHost=proxy.epa.ie -Dhttp.proxyPort=8888 -Dhttp.proxyUser=meaneym -Dhttp.proxyPassword=xxx -Dhttps.proxyHost=proxy.epa.ie -Dhttps.proxyPort=8888 -Dhttps.proxyUser=meaneym -Dhttps.proxyPassword=xxx ofbiz
```

### Apache Mesos 1.3.0
Install: <http://archive.apache.org/dist/mesos/1.3.0/mesos-1.3.0.tar.gz>   
Tutorial: <http://mesos.apache.org/gettingstarted/>   

```
abc
```

### Apache Tomcat 8.0.33
Install: <https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33-windows-x64.zip>  
Tutorial: <https://www.ntu.edu.sg/home/ehchua/programming/howto/Tomcat_HowTo.html>  


### Apache ManifoldCF
Tutorial: <https://manifoldcf.apache.org/release/trunk/en_US/end-user-documentation.html>  
Tutorial: <http://www.francelabs.com/blog/tutorial-for-combining-manifoldcf-and-elasticsearch-for-files-search/>  

Install:  

- http://ftp.heanet.ie/mirrors/www.apache.org/dist/manifoldcf/apache-manifoldcf-2.4/apache-manifoldcf-2.4-bin.tar.gz  
- http://ftp.heanet.ie/mirrors/www.apache.org/dist/manifoldcf/apache-manifoldcf-sharepoint-2010-plugin-0.4/apache-manifoldcf-sharepoint-2010-plugin-0.4-bin.tar.gz  
- http://ftp.heanet.ie/mirrors/www.apache.org/dist/manifoldcf/apache-manifoldcf-sharepoint-2013-plugin-0.1/apache-manifoldcf-sharepoint-2013-plugin-0.1-bin.tar.gz  
- http://ftp.heanet.ie/mirrors/www.apache.org/dist/manifoldcf/apache-manifoldcf-elasticsearch-1.5-plugin-2.0.1/apache-manifoldcf-elasticsearch-1.5-plugin-2.0.1-bin.tar.gz  
- http://ftp.heanet.ie/mirrors/www.apache.org/dist/manifoldcf/apache-manifoldcf-elasticsearch-plugin-2.1/apache-manifoldcf-elasticsearch-plugin-2.1-bin.tar.gz  
- https://jdbc.postgresql.org/download/postgresql-9.3-1103.jdbc3.jar  
    - Copy to `c:\dev\apache\manifoldcf-2.4\lib`
- http://central.maven.org/maven2/jcifs/jcifs/1.3.17/jcifs-1.3.17.jar
    - Copy to `c:\dev\apache\manifoldcf-2.4\connector-lib-proprietary`

In `C:\Dev\apache\tomcat-8.0.33\conf\Catalina\localhost\`
Create three XML files:
-	mcf-api-service.xml
```xml
<xmlversion="1.0" encoding="utf-8"?>
<Context docBase="c:\dev\apache\manifoldcf-2.4\web\war\mcf-api-service.war" crossContext="true">
</Context>
```
-	mcf-authority-service.xml
```xml
<xmlversion="1.0" encoding="utf-8"?>
<Context docBase="c:\dev\apache\manifoldcf-2.4\web\war\mcf-authority-service.war" crossContext="true">
</Context>
```
-	mcf-crawler-ui.xml
```xml
<xmlversion="1.0" encoding="utf-8"?>
<Context docBase="c:\dev\apache\manifoldcf-2.4\web\war\mcf-crawlerui.war" crossContext="true">
</Context>
```

Edit `c:\dev\apache\manifoldcf-2.4\connectors.xml` and uncomment:
```xml
<repositoryconnector name="Windows shares" class="org.apache.manifoldcf.crawler.connectors.sharedrive.SharedDriveConnector"/>
```
Edit `c:\dev\apache\manifoldcf-2.4\multiprocess-file-example\properties.xml`
```xml
<property name="org.apache.manifoldcf.databaseimplementationclass" value="org.apache.manifoldcf.core.database.DBInterfacePostgreSQL"/>

<property name="org.apache.manifoldcf.database.name" value="manifoldcf"/>

<property name="org.apache.manifoldcf.dbsuperusername" value="postgres"/>
<property name="org.apache.manifoldcf.dbsuperuserpassword"value="password"/>
```

Execute: `c:\dev\apache\manifoldcf-2.4\multiprocess-file-example\initialize.bat`
Execute: `c:\dev\apache\manifoldcf-2.4\multiprocess-file-example\start-agents.bat`

Edit `c:\dev\apache\tomcat-8.0.33\bin\startup.bat`

```
set "CATALINA_OPTS=Dorg.apache.manifoldcf.configfile=c:\dev\apache\manifoldcf-2.4\multiprocess-file-example\properties.xml"
```
At command prompt: 
```bash
cd c:\dev\elastic\elasticsearch-2.3.0\bin
plugin install mapper-attachments
```

Start Elasticsearch

initialize.bat

```bash
cd c:\dev\apache\manifoldcf-2.4\multiprocess-file-example
initialize.bat 
setclasspath.bat
start-agents.bat
```

Kibana Sense:
```json
PUT /fileshare
{
   "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 0 }}
}
```
```json
PUT /fileshare/file/_mapping
{
  "file" : {
    "properties" : {
      "file" : {
         "type" : "attachment"
      }
    }
  }
}
```

At CLI:
```bash
cd c:\dev\apache\manifoldcf-2.4\multiprocess-file-example
start-agents.bat
```

Start Tomcat. Go to the admin interface : <http://localhost:8080/mcf-crawler-ui/>

At CLI:
```bash
cd c:\dev\apache\manifoldcf-2.4\multiprocess-file-example
start-database.bat?
start-webapps.bat?
```

start-webapps.bat?
ManifoldCF: http://localhost:8345/mcf-crawler-ui/login.jsp

admin:admin

Run on Windows Fileshare (shared folders) Index fileshare/file


## REST API

### Python-EVE 
Install: <http://python-eve.org/install.html>  
GitHub: <https://github.com/pyeve/eve>  
Tutorial: 


Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```bash
pip install eve
```

Edit `settings.py`

At CLI 1
```bash
cd c:\dev\api\eve\eric
python run.py
```

At CLI 2
```bash
curl -i http://127.0.0.1:5000?pretty
```

- http://localhost:5000/measurements?page=2
- http://localhost:5000/measurements?max_results=30
- http://localhost:5000/measurements/58f88808c864b17558000001
- http://localhost:5000/measurements?where={"locationname":"Kilmeadan"}
- http://localhost:5000/measurements?where={"locationname":"Kilmeadan"}&page=4014
- http://localhost:5000/measurements?where={"locationname":"Kilmeadan"}&max_results=1
- http://localhost:5000/measurements?where={"measurementid":684}
- http://localhost:5000/api-docs

#### Eve-Swagger
GitHub: <https://github.com/pyeve/eve-swagger>  

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```bash
pip install eve-swagger
```

Edit `run.py` e.g. `c:\dev\api\eve\eric\run.py`

```python
from eve import Eve
from eve_swagger import swagger, add_documentation

app = Eve()
app.register_blueprint(swagger)

'# required. See http://swagger.io/specification/#infoObject for details.
app.config['SWAGGER_INFO'] = {
    'title': 'My Supercool API',
    'version': '1.0',
    'description': 'an API description',
    'termsOfService': 'my terms of service',
    'contact': {
        'name': 'nicola',
        'url': 'http://nicolaiarocci.com'
    },
    'license': {
        'name': 'BSD',
        'url': 'https://github.com/pyeve/eve-swagger/blob/master/LICENSE',
    }
}

'# optional. Will use flask.request.host if missing.
app.config['SWAGGER_HOST'] = 'localhost:5000'

'# optional. Add/Update elements in the documentation at run-time without deleting subtrees.
add_documentation({'paths': {'/status': {'get': {'parameters': [
    {
        'in': 'query',
        'name': 'foobar',
        'required': False,
        'description': 'special query parameter',
        'type': 'string'
    }]
}}}})

if __name__ == '__main__':
    app.run()
```

- <http://localhost:5000/api-docs>

#### Eve-Elastic 
GitHub: <https://github.com/petrjasek/eve-elastic>  


Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```bash
pip install Eve-Elastic
```

### Zend_Rest_Server() 
Tutorial: <https://www.packtpub.com/mapt/book/web-development/9781847195524/6/ch06lvl1sec32/Services+with+Zend_Rest_Server>  
Tutorial: <http://www.lampdev.org/programming/zend-framework/zend_rest_server-tutorial.html>  
Manual: <https://framework.zend.com/manual/1.12/en/zend.rest.server.html>  

Test PHP: <http://maurice-vm.epa.ie/rest/06/hello.php?method=sayHello>  

`rest_server.php`

```php
<?php
require_once('Zend/Loader/Autoloader.php');
$loader = Zend_Loader_Autoloader::getInstance();

class Simple_Rest_Server {
	protected $_request;
	public function __construct() { 
		$this->_request = new Zend_Controller_Request_Http();
	}
	public function get()
	{
		// we will dump the query_string
		// with a message from GET METHOD
		// if we get a get call
		// $this->_request->getQuery()
		// will return the $_SERVER['QUERY_STRING'] value
		$data = $this->_request->getQuery();
		return "FROM GET METHOD.\n" . 
		var_export($data, true);
	}
        public function HelloWorld()
	{
		// we will dump the query_string
		// with a message from HelloWorld METHOD
		// if we get a get call
		// $this->_request->getQuery()
		// will return the $_SERVER['QUERY_STRING'] value
		$data = $this->_request->getQuery();
		return "FROM HelloWorld.\n" . 
		var_export($data, true);
	}
	public function post()
	{
		// we will dump the POST DATA
		// with a message from POST METHOD
		// if we get a POST call
		// $this->_request->getRawBody()
		// will return the $_POST DATA
		$data = $this->_request->getRawBody();
		return "FROM POST METHOD.\n" . 
		"===== DATA: =====\n" .
		var_export($data, true);
	}
	public  function delete($data)
	{
		return "FROM DELETE METHOD.\n" . 
			var_export($data, true);
	}
	public  function index($data)
	{
		return "FROM INDEX METHOD.\n" . 
			var_export($data, true);
	}
}

// Initiate the Zend_Rest_Server class object
$server = new Zend_Rest_Server();
// set our Simple Rest Server class to handle the 
// Rest Service Handling
$server->setClass('Simple_Rest_Server');
// calling handle() will map and make available the 
// functions contained in Simple_Rest_Server
// for web service call from a client
$server->handle();
```

<http://localhost:8000/rest_server.php?method=get&m1=testone&m2=testtwo>  
<http://maurice-vm.epa.ie/rest_server.php?method=post&m1=testone&m2=testthree>  

Rename file to `index.php` and move to `rest` subfolder (also copy `zend` folder)  
Can omit `php` filename from URL:  
<http://maurice-vm.epa.ie/rest/?method=get&m1=testone&m2=testtwo>


### Ramses, Elasticsearch, Postgres, MongoDB
Tutorial: <https://ramses.readthedocs.io/en/stable/getting_started.html>  
Example: <https://github.com/chrstphrhrt/ramses-elasticsearch>  

#### MongoDB Option

Set `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```bash
cd c:\dev\api\ramses
virtualenv eric_api
eric_api\Scripts\activate
pip install ramses
pcreate -s ramses_starter eric_api
(Select Option (2) for MongoEngine/MongoDB)
cd eric_api
pip install waitress
pserve local.ini
```

Select Option 2 for MongoDB version (currently just for assessment – Postgres option tested and working)
 
#### Original Process (Superseded?)
Install: `> pip install ramses==0.5.0` (Per project basis)  
If `Waitress` does not install: `> pip install waitress`  
If `Cryptacular` does not install: `> pip install cryptacular` (Requires MS Visual C++ 10.0)  
- Dependencies (detailed above): Virtualenv, HTTPie, MS VC++ Build Tools 2015  

Example: <https://github.com/chrstphrhrt/ramses-elasticsearch>    

```bash
cd c:\dev\api
mkdir gii_project && cd gii_project
virtualenv venv
venv\Scripts\activate.bat
(venv) > pip install ramses==0.5.0
(venv) > pcreate -s ramses_starter gii_api
```

When prompted by `pcreate`, choose PostgreSQL (option 1) as your database and open the new project in a text editor to look around.   Start the server.  
- NOTE: If necessary edit `local.ini` Line 13 to:
    - `sqlalchemy.url = postgresql://postgres:PASSWORD@localhost:5432/gii_api`

See: <http://docs.sqlalchemy.org/en/latest/core/engines.html>

```bash
(venv) > cd gii_api
(venv) > pserve local.ini
...
Starting server in PID 40098.
serving on http://0.0.0.0:6543
```

Edit the JSON and RAML as per tutorial. Drop the Postgres DB. Delete the Elasticsearch index. 
- (Note: Port changed from 9200 to 9500: Ramses support is for ES 1.7.5, so downgraded instance installed.)

```bash
> venv\Scripts\activate.bat
(venv) > dropdb --username=postgres gii_api
(venv) > http DELETE :9500/gii_api
Open new terminal. Post data to the API:
cd c:\dev\api\gii_project
> venv\Scripts\activate.bat
(venv) > nefertari.post2api -f gii_api/gii_data.json -u http://localhost:6543/api/gii_countries
```

### Swagger 

Set NPM (Node Package Manager `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsnpm)</sup>

At bash CLI:
```bash
npm install -g swagger
swagger project create hello-world
swagger project edit
```

### Swagger-UI
GitHub: <https://github.com/swagger-api/swagger-ui>  
Tutorial: <http://swagger.io/docs/swagger-tools/#swagger-ui-documentation-29>  
Install:  <https://github.com/swagger-api/swagger-ui/archive/master.zip>  

Copy `Dist` folder to server, e.g. `C:\Apache24\htdocs\public\swagger-ui\dist`

Edit `index.html`, set `url` to Python-Eve address (ensuring that ‘Eve-Swagger’ is installed and configured)

```javascript
<script>
window.onload = function() {
  // Build a system
  const ui = SwaggerUIBundle({
    url: "http://localhost:5000/api-docs",
    dom_id: '#swagger-ui',
    presets: [
      SwaggerUIBundle.presets.apis,
      SwaggerUIStandalonePreset
    ],
    plugins: [
      SwaggerUIBundle.plugins.DownloadUrl
    ],
    layout: "StandaloneLayout"
  })

  window.ui = ui
}
</script>
```

???

Set NPM (Node Package Manager `http_proxy` at CLI <sup>[[Proxy Settings]](#proxysettingsnpm)</sup>

```bash
npm install -g react (if not installed)
npm install -g swagger-ui
```

### Pyramid-Swagger
```bash
git clone https://github.com/striglia/pyramid_swagger.git 
```

### Visual Studio WebAPI 2.0
<http://maurice-vm.epa.ie:82/eric_api/api/measurements?measurementid=211>

### Open Data API Examples
```bash
curl -i http://atlas.marine.ie/arcgis/rest/services/Geology/MapServer/8?f=pjson
```


## MediaWiki

### MediaWiki 1.28.0 
Install: <https://releases.wikimedia.org/mediawiki/1.28/mediawiki-1.28.0.tar.gz>  

For security the Apache `httpd.conf` file is edited to include the following (appended to the end of the file):

```xml
<Directory "${SRVROOT}/htdocs/mediawiki/images">
   # Ignore .htaccess files
   AllowOverride None
   
   # Serve HTML as plaintext, don't execute SHTML
   AddType text/plain .html .htm .shtml .php .phtml .php5
   
   # Don't run arbitrary PHP code.
   php_admin_flag engine off
   
   # If you've other scripting languages, disable them too.
</Directory>
```

This is to prevent malicious uploads using the Wiki image uploader. 
MySQL Config: <http://localhost:3306>  

To use ‘WikiEditor’, add to `...\mediawiki-1.28\includes\DefaultSettings.php`

```xml
$wgDefaultUserOptions = [
	…
	'usebetatoolbar' => 1,
	'usebetatoolbar-cgd' => 1,
```


SVG Tutorial: <https://www.mediawiki.org/wiki/Manual:$wgSVGConverter>  

```xml
# Allow SVG Image Uploads
## use ImageMagick in mediawiki
$wgUseImageResize = true;
$wgUseImageMagick = true;
## Enable applicable one for windows
# If you have installed ImageMagick in windows comment out below
#$wgImageMagickConvertCommand = "c:/dev/OCR/ImageMagick-7.0.3-Q16/convert";
# If you have portable version of ImageMagick. Show the path properly & comment out below line. In this case Portable ImageMagick was copied to mediawiki/extra folder. So path is shown this way.
#$wgImageMagickConvertCommand = "$IP/extra/convert";
## Enable this for Linux
#$wgImageMagickConvertCommand = "/usr/bin/convert";

# For SVG image support
$wgFileExtensions[] = 'svg';
$wgAllowTitlesInSVG = true;
$wgSVGConverter = 'ImageMagick';
$wgSVGConverters = array(
    'ImageMagick' => '"c:/dev/OCR/ImageMagick-7.0.3-Q16/convert" -background white -geometry $width $input $output',
  );

```
MySQL Config:


![image](https://user-images.githubusercontent.com/11856005/29510771-eab475f4-8654-11e7-9bb8-121560771808.png)


### Wikibase
Tutorial: <https://www.mediawiki.org/wiki/Wikibase/Installation>  
Install: <https://gerrit.wikimedia.org/r/mediawiki/extensions/Wikibase.git>  

Set `HTTP_PROXY` at CLI <sup>[[Proxy Settings]](#proxysettings)</sup>

```bash
cd c:\apache24\htdocs\mediawiki\extensions
git clone https://gerrit.wikimedia.org/r/mediawiki/extensions/Wikibase.git
cd Wikibase
composer install
cd c:\apache24\htdocs\mediawiki
php maintenance/update.php --quick --skip-external-dependencies
```


### ImageMagick 7.0.3 Win64
Install: <https://www.imagemagick.org/download/binaries/ImageMagick-7.0.3-8-Q16-x64-dll.exe>  

Used for Mediawiki and OCR.
 




## Appendix

### <a name="proxysettings"></a>Proxy Settings

Note: To set Atom IDE proxy edit the file .apmrc in folder  C:\Users\meaneym\.atom\.apm\ 

#### Windows <abbr title="Command Line Interface">CLI</abbr>

```
set http_proxy=http://username:password@proxy.host.ie:8888
set https_proxy=https://username:password@proxy.host.ie:8888
```

#### Windows <abbr title="Command Line Interface">CLI</abbr> – Composer

```
set HTTP_PROXY_REQUEST_FULLURI=0
set HTTPS_PROXY_REQUEST_FULLURI=0
```

#### <a name="proxysettingsnpm"></a>Windows <abbr title="Command Line Interface">CLI</abbr> – NPM (Node Package Manager)

Source: https://jjasonclark.com/how-to-setup-node-behind-web-proxy/ 

```
npm config set proxy http://username:password@proxy.host.ie:8888
npm config set https-proxy http://username:password@proxy.host.ie:8888
```

#### <a name="proxysettingsbash"></a> Linux <abbr title="Command Line Interface">CLI</abbr> (e.g. MinTTY, MINGW64 (Git Bash))

```
export http_proxy=http://username:password@proxy.host.ie:8888
export https_proxy=https://username:password@proxy.host.ie:8888
```
or (with domain)
```
export http_proxy=http://epa\\username:password@proxy.host.ie:8888
export https_proxy=https://epa\\username:password@proxy.hostie:8888
```

### MD/Github Editing

Tutorial: <http://solutionoptimist.com/2013/12/28/awesome-github-tricks>  
Tutorial: <https://help.github.com/articles/basic-writing-and-formatting-syntax>  
Tutorial: <https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#lists>  
TOC: <https://tableofcontents.herokuapp.com/>  


## Deprecated


### HDFSExplorer (Hadoop - deprecated)

Download: <https://github.com/SaschaDittmann/HdfsExplorer> (Not used?)  

Download and build in VS  

![hdfsexperror](https://user-images.githubusercontent.com/11856005/28170019-f83ac60c-67db-11e7-8aec-4de6fbecaa1a.png)

Could not find path to 'c:\dev\hadoop\java'  


### Apache Hive 2.3.0 (No Windows)
**Data warehouse software facilitating reading, writing, and managing large datasets residing in distributed storage using SQL**

<img alt="logo" src="https://hive.apache.org/images/hive_logo_medium.jpg" />

Home: <https://hive.apache.org/>   
Install: <http://archive.apache.org/dist/hive/hive-2.3.0/apache-hive-2.3.0-bin.tar.gz>   
Tutorial: <http://www.zymr.com/hive-installation-windows-7/>   

From [Wikipedia](https://en.wikipedia.org/wiki/Apache_Hive):
> Apache Hive supports analysis of large datasets stored in Hadoop's HDFS and compatible file systems such as Amazon S3 filesystem. It provides an SQL-like query language called HiveQ


Environment Variables:
-	Add `;c:\dev\apache\hive-2.3.0\bin` to environment variable `PATH`
-	Create new environment variable `HIVE_HOME`, set to `c:\dev\apache\hive-2.3.0`
-	Create new environment variable `CLASSPATH` if requtred, set to (or append) `;c:\dev\apache\hive-2.3.0\lib` and `;c:\dev\hadoop\hadoop-2.7.1\share\hadoop\common\lib`



## Sandbox

If you're ever stuck on a Markdown question, there's a help button on the right side of the toolbar:

![Screenshot of the toolbar](http://so.mrozekma.com/editor-bar-help-button.png)

That [help page](http://stackoverflow.com/editing-help) explains how to do the simple case:

> ### Advanced lists: Nesting
> To put other Markdown blocks in a list; just indent four spaces for each nesting level

For example (see the [markdown for this post](http://meta.stackoverflow.com/revisions/01c25c3a-3653-49f4-b6be-4323c50bff2d/view-source)):

1. Dog
    1. German Shepherd
    2. Belgian Shepherd
        1. Malinois
        2. Groenendael
        3. Tervuren
2. Cat
    1. Siberian
    2. Siamese



- [x] Finish my changes
- [ ] Push my commits to GitHub
- [ ] Open a pull request
