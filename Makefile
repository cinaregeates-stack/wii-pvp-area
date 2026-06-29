# Proje ismi
TARGET := Wii-PvP-Arena
BUILD := build
SOURCES := src
INCLUDES := include

# devkitPro yolları
export PATH := $(DEVKITPPC)/bin:$(PATH)

# Derleme kuralları
PREFIX := powerpc-eabi-
CC := $(PREFIX)gcc
LD := $(PREFIX)gcc
OBJCOPY := $(PREFIX)objcopy

CFLAGS := -g -O2 -Wall -I$(INCLUDES) -DGEKKO -mrvl -mcpu=750 -meabi -mhard-float
LDFLAGS := -g -L$(DEVKITPRO)/libogc/lib/wii -logc -lm


# Dosya listeleri
CFILES := $(foreach dir,$(SOURCES),$(wildcard $(dir)/*.c))
OFILES := $(CFILES:.c=.o)

.PHONY: all clean

all: $(TARGET).dol

$(TARGET).dol: $(TARGET).elf
	$(OBJCOPY) -O binary $< $@

$(TARGET).elf: $(OFILES)
	$(LD) $(OFILES) $(LDFLAGS) -o $@

clean:
	rm -f $(OFILES) $(TARGET).elf $(TARGET).dol
