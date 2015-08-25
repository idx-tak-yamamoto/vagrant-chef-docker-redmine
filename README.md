# vagrant-chef-docker-redmine

VAGRANT＋CHEFを使って仮想環境にREDMINEをインストールする。  
※Windows環境を想定  

1.各種アプリをインストール  
VirtualBox  
https://www.virtualbox.org/  
Vagrant  
https://www.vagrantup.com/  
Chef  
https://www.chef.io/chef/  

2.Vagrant プラグインをインストール  
$ vagrant plugin install vagrant-omnibus   

3.任意のフォルダを作成  
mkdir D:\redmine  
cd D:\redmine

4.Vagrant実行  
vagrant up --provision

5.確認  
http://localhost:3000/  

id:admin  
pass:admin  
