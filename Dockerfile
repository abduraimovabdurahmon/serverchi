# Python asosiy image tanlaymiz
FROM python:3.9-alpine

LABEL author="Abduraxmon"

# Ishchi jildni belgilaymiz
WORKDIR /app

# Zarur vositalarni o'rnatamiz
RUN apk add --no-cache git

# Virtual muhit yaratamiz
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Muhit o'zgaruvchilarini sozlaymiz
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# MkDocs va material theme o'rnatamiz
RUN pip install --no-cache-dir mkdocs mkdocs-material

# Loyiha fayllarini nusxalaymiz
COPY . .

# Statik saytni yaratamiz
RUN mkdocs build

# 8000-portni ochamiz
EXPOSE 8000

# Python ning built-in serveri bilan statik fayllarni xizmat qilamiz
CMD ["python", "-m", "http.server", "--directory", "site", "8000"]