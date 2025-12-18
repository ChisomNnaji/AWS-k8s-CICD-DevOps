FROM nginx:alpine
LABEL maintainer="devops@example.com"

# Copy application code
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]