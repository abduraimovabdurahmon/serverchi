# Caddy asosiy image tanlaymiz
FROM caddy:2.8

LABEL author="Abduraxmon"

# Ishchi jildni belgilaymiz
WORKDIR /app

# Python va MkDocs o'rnatish uchun zarur vositalarni qo'shamiz
RUN apk add --no-cache python3 py3-pip git

# Virtual muhit yaratamiz
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Muhit o'zgaruvchilarini sozlaymiz
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# MkDocs va kerakli pluginlarni virtual muhitda o'rnatamiz
RUN pip install --no-cache-dir mkdocs mkdocs-material

# Loyiha fayllarini nusxalaymiz
COPY . .

# MkDocs yordamida statik saytni yaratamiz
RUN mkdocs build

# Statik fayllarni Caddy uchun belgilangan papkaga ko'chiramiz
RUN mkdir -p /srv && cp -r site/* /srv/

# Caddy uchun log papkasini yaratamiz
RUN mkdir -p /var/log/caddy

# Portni ochamiz
EXPOSE 80 443

# Caddy ishga tushirish buyrug'i
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]