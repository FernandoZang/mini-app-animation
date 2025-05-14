FROM gitpod/workspace-full

# Install system dependencies
RUN sudo apt-get update && sudo apt-get install -y \
    curl unzip xz-utils zip libglu1-mesa openjdk-17-jdk \
    clang cmake ninja-build pkg-config libgtk-3-dev

# Set environment variables
ENV FLUTTER_HOME=/home/gitpod/flutter
ENV PATH="${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin:${PATH}"

# Install Flutter (stable channel, version 3.24.5)
RUN git clone https://github.com/flutter/flutter.git ${FLUTTER_HOME} \
    && cd ${FLUTTER_HOME} \
    && git checkout stable \
    && git pull \
    && git reset --hard 3.24.5 \
    && flutter doctor

# Pre-cache Flutter artifacts
RUN flutter precache
