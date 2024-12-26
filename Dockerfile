# Stage 1: Builder Stage
FROM alpine:latest AS builder

# Set working directory
WORKDIR /app

# Copy website files into the builder stage
COPY ./kider-webfiles /app

# Perform any build steps (e.g., minifying JS/CSS, compiling assets, etc.)
# Example: Minify HTML (if you use a tool or script for this)
# RUN some_minification_tool index.html -o index.min.html

# Stage 2: Final Image
FROM httpd:2.4-alpine
# Copy only the processed files from the builder stage to the final image
COPY --from=builder /app /usr/local/apache2/htdocs/

# Expose Apache port
EXPOSE 80

# Default command to start Apache
CMD ["httpd-foreground"]

