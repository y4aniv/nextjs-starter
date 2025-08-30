FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY package*.json ./

RUN pnpm install

COPY . .

RUN pnpx prisma generate
RUN pnpx prisma db push

RUN pnpm run build

EXPOSE 80

CMD ["pnpm", "start", "-p", "80"]