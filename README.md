# Docker Single Machine Zero Downtime Deployment with Haproxy

```
-- 1: First deployment
$ docker-compose up -d web1 web2 haproxy

-- 2: Change web app
$ echo '(Updated)' >> index.html
$ docker-compose build

-- 3: Rolling update deployment
$ docker-compose up -d web1
  (( wait for web1 to be available ))
$ docker-compose exec web1 bash -c \
  'until $(curl --output /dev/null --silent --head --fail http://localhost); do sleep 1; done;'
$ docker-compose up -d web2
```

# Reference

- https://hub.docker.com/_/haproxy/
- https://hub.docker.com/_/nginx/
- http://stackoverflow.com/questions/11904772/how-to-create-a-loop-in-bash-that-is-waiting-for-a-webserver-to-respond
