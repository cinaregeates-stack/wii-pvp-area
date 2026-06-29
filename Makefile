TARGET := Wii-PvP-Arena
PREFIX := powerpc-eabi-
CC := $(PREFIX)gcc

# Wii yollarını manuel tanımlıyoruz
DEVKITPRO := /opt/devkitpro
LIBOGC := $(DEVKITPRO)/libogc

CFLAGS := -g -O2 -Wall -I$(LIBOGC)/include -DGEKKO -mrvl -mcpu=750 -meabi -mhard-float
LDFLAGS := -L$(LIBOGC)/lib/wii -logc -lm

CFILES := src/main.c
OFILES := $(CFILES:.c=.o)

all: $(TARGET).dol

$(TARGET).dol: $(TARGET).elf
	$(PREFIX)objcopy -O binary $< $@

$(TARGET).elf: $(OFILES)
	$(CC) $(OFILES) $(LDFLAGS) -o $@

clean:
	rm -f $(OFILES) $(TARGET).elf $(TARGET).dol
