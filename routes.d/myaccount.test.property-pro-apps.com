server {
    server_name myaccount.test.property-pro-apps.com;
    location / {
        proxy_set_header        Host $host:$server_port;
        proxy_set_header        X-Real-IP $remote_addr;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header        X-Forwarded-Proto $scheme;
        # Fix the "It appears that your reverse proxy set up is broken" error.
        proxy_pass          http://192.168.1.50:3020;
        proxy_read_timeout  90;
        proxy_redirect      http://192.168.1.50:3020 http://myaccount.test.property-pro-apps.com;
    }
}
