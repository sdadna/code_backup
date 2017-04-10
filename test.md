# Description

> you should add follow command in the **dbus** and **blue** target of makefile if you want to add bluez command to the object system
>	$(MAKE) -C $(SRC) install DESTDIR=<roofs>
> eg:
> $(MAKE) -C $(DBUS_SRC) install DESTDIR=/home/sda/MR-7252S-7250/TCH_DevelopmentKit/rookdisk
> if you want to change bluetooth work path,you need to modify *--localstatedir* in the **bluez** target of makefile
> eg:
> --localstatedir=/oem_data/
> 

# Quick start

> source env.sh
> make all
