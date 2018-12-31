# README

## Usage

1. Install [Docker and docker-compose](http://docs.docker.jp/engine/installation/) .
2. Clone this repository.
3. Build Containers `docker-compose build`
4. Create Database. `docker-compose web bundle exec rails db:setup`
5. Execute `docker-compose up`
6. Access `http://localhost:3000/posts` , and try !!

## Errors

### ActionView::Template::Error (couldn't find file 'trix/dist/trix' with type 'text/css'

Enter web container and yarn install again.  

```
$ docker exec -it action_text_sample_web_1 /bin/bash
# yarn install
```
