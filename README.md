# django_websocket

```
pip install poetry

＃初始化
poetry init

# 安裝依賴套件
cd djchat
poetry install

# mysql create database websocket
# ORM生成table
python manage.py migrate

# 匯入mysql資料
mysql -u you_username -p your_database_name < websocket.sql

#確認是否能啟動django
python manage.py runserver

brew install node

#Using nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

#Install Node.js and npm using nvm:
nvm install node

cd reactchat
npm i

#確認是否能啟動react
npm run dev
```

聊天教學
### step 1 login
![img](https://github.com/leolee1204/django_websocket/blob/fd4548b7c831092141e70a18fc90edcb4c714b22/login.png)

### step 2 get authorized
![img](https://github.com/leolee1204/django_websocket/blob/fd4548b7c831092141e70a18fc90edcb4c714b22/get_username.png)

### step 3 go to channel to talk
![img](https://github.com/leolee1204/django_websocket/blob/fd4548b7c831092141e70a18fc90edcb4c714b22/conversation.png)
