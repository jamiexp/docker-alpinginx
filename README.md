# docker-alpinginx

Docker image which includes Nginx on Alpine Linux.

- [Alpine](http://www.alpinelinux.org/) - small footprint OS    
- [Nginx](https://www.nginx.com) - non-blocking event-driven HTTP Server    

Nginx version: `1.9.7`

---

### Usage 

After executing the following - and assuming port 80 was free on your host - you should be able to view the default Nginx welcome page at the IP of your host. 

```bash
docker run -d -p 80:80 jonjack/alpinginx
```

The image exposes the following ports:   

`80` `8080` `443`

---

### Mounting a Volume

Mount a volume so that you can push your own content into the Nginx home path.

```bash
docker run -d -p 80:80 -v /host/path/nginx/html:/app/nginx/html jonjack/alpinginx
```

Content put into `/host/path/nginx/html` on the host machine should then be accessible to the Nginx document root at `/app/nginx/html`.

---

### Why Another Image ?

There are a few Nginx on Alpine images already, but I had some specific use case of my own:-

- verifies the integrity of the Nginx archive
- uses latest version of Nginx
- Nginx docroot at `/app/nginx`
- Removes any unnecessary leftovers of the build

The Dockerfile is not overly pretty but the result is an image just shy of 25 MB.

---

Current size: 25 MB.