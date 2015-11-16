# docker-alpinginx

Docker image which includes Nginx on Alpine Linux.

- [Alpine](http://www.alpinelinux.org/) - small footprint OS    
- [Nginx](https://www.nginx.com) - non-blocking event-driven HTTP Server 

---

Currently at 24.82 MB.

---

### Usage 

#### Build the Image

```bash
docker build -t alpinginx .
```

#### Run a Container

```bash
docker run -d -p 80:80 alpinginx
```

Assuming port 80 was free on your host, you should be able to view the default Nginx welcome page at [http://ip](http://ip) 