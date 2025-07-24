# ----- STAGE 1: Build -----
FROM gradle:8.7.0-jdk17 as builder
WORKDIR /app
COPY . .
RUN gradle :app:installDist --no-daemon

# ----- STAGE 2: Run -----
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/app/build/install/app /app
EXPOSE 8080
CMD ["./bin/app"]