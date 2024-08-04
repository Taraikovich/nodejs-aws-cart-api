# Мультистейдж сборка для оптимизации размеров
# Первый этап: установка зависимостей и сборка TypeScript

FROM node:18 AS builder
WORKDIR /usr/app/

# Копирование только package.json и package-lock.json для установки зависимостей
COPY package*.json ./
RUN npm install
# Копирование исходного кода и сборка
COPY . .
RUN npm run build

# Второй этап: создание финального минимизированного образа
FROM node:18-alpine
WORKDIR /app

# Копирование только production зависимостей из предыдущего этапа
COPY --from=builder /usr/app/node_modules ./node_modules
COPY --from=builder /usr/app/dist ./dist
COPY --from=builder /usr/app/package.json ./package.json

# Экспонирование порта
EXPOSE 4000

# Команда для запуска приложения
CMD ["node", "dist/main.js"]
