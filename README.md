# 💻 PgBouncer Multiarch Docker Image

 This repository hosts an automated build system for creating 🐳 Docker images of [PgBouncer](https://www.pgbouncer.org/).
 The built AMD64/ARM64 Docker images are also [hosted in this repository](https://github.com/icoretech/pgbouncer-docker/pkgs/container/pgbouncer-docker) with semantic tagging.

## 📖 Overview

The build system automates the process of pulling the latest code from the main branch of the PgBouncer project weekly, packaging it into a Docker image, and publishing the image.

⚡️ We now have a [Helm chart available for deploying PgBouncer](https://github.com/icoretech/helm).

## 💡 Usage

To pull a Docker image, use the following command:

```bash
docker pull ghcr.io/icoretech/pgbouncer-docker:<tag>
```

Replace `<tag>` with the specific version you wish to pull.

You can find the available tags on the [GitHub Packages page](https://github.com/icoretech/pgbouncer-docker/pkgs/container/pgbouncer-docker) for this repository.

## 📄 License

The Docker images and the code in this repository are released under [MIT License](LICENSE).

Please note that the PgBouncer project has its own license, which you should review if you plan to use, distribute, or modify the code.
