# LTS Nodejs
FROM node:16.13.1

ENV NODE_ENV development

WORKDIR /usr/src/app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY package*.json ./

RUN [ "/bin/bash", "-c", "npm ci && mv node_modules ../"]

# ENV PATH /usr/node_modules/.bin:$PATH

ENTRYPOINT ["/entrypoint.sh"]

CMD ["npm", "run", "dev"]