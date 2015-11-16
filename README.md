# docker-alpinginx

Docker image which includes Nginx on Alpine Linux.

- [Alpine](http://www.alpinelinux.org/) - small footprint OS    
- [Nginx](https://www.nginx.com) - non-blocking event-driven HTTP Server 

---

### Usage 

#### Build the Image

```bash
docker build -t nodeginx .
```

#### Run a Container

```bash
docker run -d -p 80:80 nodeginx
```

Assuming port 8080 was free on your host, you should be able to view the default Nginx welcome page at [http://ip](http://ip) 