FROM python:3.11

EXPOSE 80
WORKDIR /app

RUN apt update -y && apt install -y libpq-dev

RUN mkdir -p ./storage
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

COPY backend ./backend/
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "80"]
