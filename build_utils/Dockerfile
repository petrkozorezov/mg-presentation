FROM dockcross/linux-x64

ENV DEFAULT_DOCKCROSS_IMAGE backslide-build-image
RUN curl -sL https://deb.nodesource.com/setup_11.x | sudo bash -
RUN sudo apt-get -y install nodejs
RUN sudo npm install --unsafe-perm=true -g backslide
RUN sudo mkdir -p /usr/share/man/man1 && sudo apt-get -y install default-jre
RUN sudo apt-get -y install graphviz
RUN sudo npm install node-plantuml -g
RUN sudo apt-get -y install libxss1 libatk-bridge2.0-0 libgtk-3-0
