name: Build and push container
on: [push]

jobs:
  build:
    name: Build and push container
    runs-on: ubuntu-latest
    steps:
      - name: Build docker images using cache
        uses: whoan/docker-build-with-cache-action@v2
        with:
          username: soichisumi
          password: "${{ secrets.DOCKER_PASSWORD }}"
          image_name: soichisumi/slack-janken
