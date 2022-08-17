FROM i386/ubuntu:latest
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y gcc g++ make git binutils libc6-dev sudo nasm wget lbzip2 libmpc-dev libmpfr-dev libgmp-dev libssl-dev cmake libboost-all-dev vim libpoco-dev
RUN adduser --disabled-password --gecos '' user
RUN echo 'user ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/user
USER user
WORKDIR /home/user
RUN wget https://github.com/nativeos/i386-elf-toolchain/releases/download/preview/i386-elf-binutils-linux-i686.tar.bz2
RUN wget https://github.com/nativeos/i386-elf-toolchain/releases/download/preview/i386-elf-gcc-linux-i686.tar.bz2
RUN tar xf i386-elf-binutils-linux-i686.tar.bz2 
RUN tar xf i386-elf-gcc-linux-i686.tar.bz2
RUN cp -r i386-elf-binutils/* i386-elf-gcc/
RUN rm -rf i386-elf-binutils i386-elf-binutils-linux-i686.tar.bz2 i386-elf-gcc-linux-i686.tar.bz2
RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/i686-linux-gnu-gcc-7 2
RUN sudo update-alternatives --install /usr/bin/gcc gcc /home/user/i386-elf-gcc/bin/i386-elf-gcc 1
RUN git clone https://github.com/sitorasu/boots
WORKDIR /home/user/boots
RUN make
