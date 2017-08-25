docker exec -it $(docker ps | grep postman_db | awk '{ print $1 }') /bin/sh -c 'dropdb -U postgres postman_dev'
docker exec -it $(docker ps | grep postman_db | awk '{ print $1 }') /bin/sh -c 'createdb -U postgres postman_dev'
docker exec -it $(docker ps | grep postman_web | awk '{ print $1 }') /bin/sh -c 'npm run db:migrate'
docker exec -it $(docker ps | grep postman_web | awk '{ print $1 }') /bin/sh -c 'npm run db:seed'