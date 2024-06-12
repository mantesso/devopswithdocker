***Backend image***

backend before:
```
REPOSITORY                                   TAG               IMAGE ID       CREATED             SIZE
back2                                        latest            37e0b35783a4   23 minutes ago      934MB
```

backend after: 
```
REPOSITORY                                   TAG               IMAGE ID       CREATED             SIZE
back3                                        latest            42df57993bc4   8 seconds ago       934MB
```

changed backend Dockerfile: 
```
FROM golang:1.16
WORKDIR /usr/src/app
COPY . .
EXPOSE 8080
RUN go build && useradd -m appuser && chown appuser .
USER appuser
CMD ./server
```



***Frontend image***

frontend before:
```
REPOSITORY                                   TAG               IMAGE ID       CREATED             SIZE
front2                                       latest            302573563824   31 minutes ago      1.31GB
```

frontend after: 
```
REPOSITORY                                   TAG               IMAGE ID       CREATED             SIZE
front3                                       latest            cb3e85de644b   23 hours ago    1.31GB
```

changed frontend Dockerfile:
```
FROM node:16
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 5000
RUN npm run build && npm install -g serve && npm cache clean --force && useradd -m appuser && chown appuser .
USER appuser
CMD serve -s -l 5000 build
```