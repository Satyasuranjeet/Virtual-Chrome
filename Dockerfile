FROM kasmweb/chrome:1.16.0

ENV VNC_PW=password
ENV SSL_ONLY=false

EXPOSE 6901

CMD ["/dockerstartup/vnc_startup.sh"]
