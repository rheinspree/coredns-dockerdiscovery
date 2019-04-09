FROM golang:1.10.3-stretch

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

COPY . /coredns-dockerdiscovery
RUN go get github.com/rheinspree/coredns-dockerdiscovery
RUN cd /coredns-dockerdiscovery && make coredns

EXPOSE 15353 15353/udp
ENTRYPOINT ["/coredns-dockerdiscovery/coredns"]
