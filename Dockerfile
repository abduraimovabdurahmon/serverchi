# Python asosiy image tanlaymiz
FROM python:3.9-slim

LABEL auhthor="Abduraxmon"

# Ishchi jildni belgilaymiz
WORKDIR /app

# Muhit o'zgaruvchilarini sozlaymiz
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Zarur paketlarni o'rnatamiz
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# MkDocs va kerakli pluginlarni o'rnatamiz
RUN pip install --no-cache-dir mkdocs mkdocs-material

# Hujjatlarni nusxalaymiz
COPY . .

# Portni ochamiz (agar kerak bo'lsa)
EXPOSE 8000

# Ishga tushirish buyrug'i
CMD ["mkdocs", "serve", "--dev-addr", "0.0.0.0:8000"]