FROM kasmweb/chrome:1.16.0

# Set VNC password (optional: change for security)
ENV VNC_PW=password

# Expose port for noVNC access
EXPOSE 6901

CMD ["/dockerstartup/vnc_startup.sh"]
