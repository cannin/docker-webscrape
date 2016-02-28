FROM cannin/r-shiny-server:ubuntu-14.04.4_r-3.2.3_shiny-server-1.4.2.786

# PhantomJS
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        bzip2 \
        libfontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
    && mkdir /tmp/phantomjs \
    && curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
           | tar -xj --strip-components=1 -C /tmp/phantomjs \
    && cd /tmp/phantomjs \
    && mv bin/phantomjs /usr/local/bin

RUN apt-get -y install python-pip libssl-dev libsasl2-dev ipython

RUN R -e "install.packages(c('rmongodb', 'rvest', 'jsonlite', 'curl', 'rAltmetric', 'XML', 'RISmed', 'mongolite'), repos='http://cran.rstudio.com/')"

RUN pip install selenium
RUN pip install pymongo

#CMD Rscript -e 'setwd('/workspace'); source('script.R')'
