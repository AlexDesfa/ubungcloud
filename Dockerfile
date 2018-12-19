from ubuntu
RUN apt-get -y update \
&& apt-get -y upgrade \
&& apt-get -y install python3 python3-pip vim curl \
&& pip3 install gcloud \
&& apt -y install lsb-core git openssh-client
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y
RUN mkdir /testgcloud
#COPY ./testgcloud/credential.json /testgcloud/
COPY ./testgcloud/main.py /testgcloud/
ENV GOOGLE_APPLICATION_CREDENTIALS /testgcloud/credential.json
RUN echo 'echo "put your google .json credentials in /testgcloud/credential.json"' >> ~/.bashrc

WORKDIR /testgcloud
#CMD python3 /testgcloud/main.py
CMD bash
