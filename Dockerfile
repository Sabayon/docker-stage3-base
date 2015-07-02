FROM sabayon/gentoo-stage3-amd64

MAINTAINER mudler <sabayonlinux.org>

# Copy busybox and temporary files to the container
COPY bin /bin/
COPY tmp /tmp/

# Install a stage tarball
RUN /tmp/base.sh && \
    rm --force --recursive /tmp/* /usr/portage/packages/*

# Create a mount point for binary packages
VOLUME ["/usr/portage/packages"]

CMD ["/bin/bash"]
