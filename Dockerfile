# Use a specific base image
FROM lukemathwalker/cargo-chef:latest-rust-slim-bookworm AS chef

# Assuming you have some build steps here
# ...

# Final stage
FROM debian:bookworm-slim

# Set up working directory
WORKDIR /app

# Copy build artifacts from the previous stage
COPY --from=chef /path/to/build/artifacts /app

# Set up permissions
RUN chmod -R 755 /usr/local/bin
VOLUME ["/opt/stalwart-mail"]
EXPOSE 443 25 587 465 143 993 4190 8080

# Entry point
ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]

