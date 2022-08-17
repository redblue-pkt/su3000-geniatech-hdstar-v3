ccflags-y += -Idrivers/media/dvb-core
ccflags-y += -Idrivers/media/dvb-frontends
ccflags-y += -Idrivers/media/tuners
ccflags-y += -Iinclude/media

obj-m += ds3000.o
obj-m += ts2020.o
obj-m += m88ds3103.o
obj-m += dvb-usb-dw2102.o

all:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	@$(foreach file, $(wildcard ds3000.ko), cp -rf $(file) /lib/modules/$(shell uname -r)/kernel/drivers/media/dvb-frontends;)
	@$(foreach file, $(wildcard ts2020.ko), cp -rf $(file) /lib/modules/$(shell uname -r)/kernel/drivers/media/dvb-frontends;)
	@$(foreach file, $(wildcard m88ds3103.ko), cp -rf $(file) /lib/modules/$(shell uname -r)/kernel/drivers/media/dvb-frontends;)
	@$(foreach file, $(wildcard dvb-usb-dw2102.ko), cp -rf $(file) /lib/modules/$(shell uname -r)/kernel/drivers/media/usb/dvb-usb;)
	@depmod -a
