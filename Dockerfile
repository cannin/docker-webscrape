FROM cannin/r-shiny-server:ubuntu-14.04.4_r-3.2.3_shiny-server-1.4.2.786

RUN apt-get -y install python-pip phantomjs libssl-dev libsasl2-dev

RUN R -e "install.packages(c('rmongodb', 'rvest', 'jsonlite', 'curl', 'rAltmetric', 'XML', 'RISmed', 'mongolite'), repos='http://cran.rstudio.com/')"

RUN pip install selenium
RUN pip install pymongo

#CMD Rscript -e 'setwd('/workspace'); source('script.R')'
