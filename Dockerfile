FROM nikolaik/python-nodejs:python2.7-nodejs12

WORKDIR /build
ADD https://shopify.github.io/themekit/scripts/install.py install.py
RUN python install.py

FROM cirros AS themekit
COPY --from=builder /usr/local/bin/theme /usr/local/bin/
ENTRYPOINT [ "/usr/local/bin/theme" ]
