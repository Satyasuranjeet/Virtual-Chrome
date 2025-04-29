FROM kasmweb/chrome:1.16.0

# Set VNC password
ENV VNC_PW=password

# Disable internal SSL (Render provides SSL)
ENV SSL_ONLY=false

# Expose noVNC port (Render will proxy to this)
EXPOSE 6901

# Fix noVNC binding and start
CMD sed -i 's/--listen 127.0.0.1/--listen 0.0.0.0/' /dockerstartup/vnc_startup.sh && \
    /dockerstartup/vnc_startup.sh
