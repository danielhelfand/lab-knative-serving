FROM quay.io/eduk8s/workshop-dashboard:master

COPY --chown=1001:0 . /home/eduk8s/

ENV KN_CLI_VERSION=0.14.0
RUN curl -L https://github.com/knative/client/releases/download/v${KN_CLI_VERSION}/kn-linux-amd64 -o kn && \
    chmod 755 kn && \
    mv kn /opt/eduk8s/bin && \
    fix-permissions /home/eduk8s