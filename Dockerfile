FROM jenkins/jenkins:lts
MAINTAINER mariusz@kabala.waw.pl
USER root

RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce && \
   apt-get -y install ssh-askpass

RUN /usr/local/bin/install-plugins.sh \
    role-strategy \
    matrix-auth \
    github-oauth \
    github \
    ghprb \
    git \
    git-client \
    s3 \
    amazon-ecs \
    amazon-ecr \
    docker-workflow \
    workflow-aggregator \
    workflow-multibranch \
    job-dsl \
    ssh-slaves \
    envinject \
    docker-build-publish \
    antisamy-markup-formatter \
    multiple-scms \
    build-timeout \
    queue-cleanup \
    nodejs \
    ansicolor \
    checkstyle \
    build-name-setter \
    timestamper \
    modernstatus \
    simple-theme-plugin \
    mail-watcher-plugin \
    allure-jenkins-plugin \
    build-blocker-plugin \
    parameterized-trigger \
    conditional-buildstep \
    throttle-concurrents \
    testng-plugin \
    rebuild \
    groovy-postbuild \
    sonar \
    ws-cleanup \
    build-user-vars-plugin \
    cobertura \
    progress-bar-column-plugin \
    extra-columns \
    cucumber-reports \
    dashboard-view \
    gatling \
    github-branch-source \
    htmlpublisher \
    git-parameter \
    jackson2-api \
    metrics-graphite \
    metrics \
    ci-skip \
    mask-passwords \
    pipeline-utility-steps \
    configurationslicing \
    flow \
    jobConfigHistory \
    job-import-plugin \
    managed-scripts \
    jenkins-multijob-plugin \
    ssh \
    ssh-agent \
    claim \
    flaky-test-handler \
    junit-attachments \
    test-stability \
    pipeline-maven \
    tasks \
    postbuild-task \
    permissive-script-security \
    blueocean \
    influxdb \
    extensible-choice-parameter \
    pipeline-githubnotify-step \
    command-launcher \
    robot \
    uno-choice \
    audit-trail \
    build-with-parameters \
    workflow-remote-loader \
    clover \
    cloverphp \
    lockable-resources \
    http_request \
    pipeline-github-lib \
    hidden-parameter \
    configuration-as-code \
    configuration-as-code-support \
    ;
