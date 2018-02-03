FROM ubuntu:16.04

LABEL owner="https://github.com/PCGen/pcgen"

ENV PCGEN_VERSION "6.06.01"

WORKDIR /home/pcgen

ADD https://github.com/PCGen/pcgen/releases/download/${PCGEN_VERSION}/pcgen-${PCGEN_VERSION}-full.zip .

RUN apt-get -qq update -y && \
    apt-get -qq install -y unzip default-jre && \
    unzip -q pcgen-${PCGEN_VERSION}-full.zip

WORKDIR /home/pcgen/pcgen

VOLUME /home/pcgen/pcgen

ENTRYPOINT ["java", "-jar", "pcgen.jar"]
