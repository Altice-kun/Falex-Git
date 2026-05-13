FROM ubuntu:22.04

RUN apt update && apt install -y live-build debootstrap squashfs-tools xorriso isolinux syslinux-efi grub-pc-bin grub-efi-amd64-bin mtools dosfstools

COPY build.sh /build.sh
RUN chmod +x /build.sh

CMD ["/build.sh"]