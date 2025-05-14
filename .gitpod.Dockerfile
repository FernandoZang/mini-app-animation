FROM gitpod/workspace-full

# Install Flutter 3.5.4
ENV FLUTTER_VERSION=3.5.4

RUN sudo apt-get update && sudo apt-get install -y curl unzip xz-utils git clang cmake ninja-build pkg-config libgtk-3-dev

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /home/gitpod/flutter \
    && cd /home/gitpod/flutter \
    && git checkout $FLUTTER_VERSION \
    && /home/gitpod/flutter/bin/flutter precache

# Add Flutter to PATH
ENV PATH="/home/gitpod/flutter/bin:/home/gitpod/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Accept Android licenses
RUN yes | /home/gitpod/flutter/bin/flutter doctor --android-licenses || true
