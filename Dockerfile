FROM kasmweb/chrome:1.16.0

USER root

# Set environment variables
ENV PORT=10000
ENV VNC_PW=password
ENV KASM_USER=kasm_user
ENV KASM_PASSWORD=${VNC_PW}

# Expose the Render-compatible port
EXPOSE ${PORT}

# Remove original supervisor config and add custom one
RUN rm /etc/supervisor/conf.d/supervisord.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
