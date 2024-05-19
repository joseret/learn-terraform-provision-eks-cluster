# Using the Ubuntu image (our OS)
FROM ubuntu:latest
# Update package manager (apt-get) 
# and install (with the yes flag `-y`)
# Python and Pip
RUN apt update && apt install -y \
  python3 \
  python3-pip


COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt

CMD [bash]