FROM baseImage

COPY . /web-app
WORKDIR /web-app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "web-app.app:app", "--host", "0.0.0.0", "--port", "8000"]