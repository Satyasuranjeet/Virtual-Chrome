FROM kasmweb/chrome:1.16.0

# Set Render's expected environment variable
ENV PORT=10000
ENV VNC_PORT=$PORT
ENV VNC_PW=password

# Expose Render's dynamic port (default is 10000)
EXPOSE $PORT

# Override supervisord config to use the PORT
# We'll symlink 6901 config to point to $PORT
RUN sed -i "s/6901/${PORT}/g" /dockerstartup/vnc_startup.sh \
  && sed -i "s/6901/${PORT}/g" /etc/supervisor/conf.d/supervisord.conf

# Set default user/password
ENV KASM_USER=kasm_user
ENV KASM_PASSWORD=${VNC_PW}

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
