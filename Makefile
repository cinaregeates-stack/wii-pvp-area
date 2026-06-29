# Proje ismi
TARGET := Wii-PvP-Arena

# Wii araçları
PREFIX := powerpc-eabi-
CC := $(PREFIX)gcc

# Wii yolları (devkitPro değişkenleri)
INCLUDE := -I$(LIBOGC_INC)
LIB := -L$(LIBOGC_LIB)

CFLAGS := -g -O2 -Wall $(INCLUDE) -DGEKKO -mrvl -mcpu=750 -meabi -mhard-float
LDFLAGS := $(LIB) -logc -lm

# Dosyalar
CFILES := src/main.c
OFILES := $(CFILES:.c=.o)

all: $(TARGET).dol

$(TARGET).dol: $(TARGET).elf
	$(PREFIX)objcopy -O binary $< $@

$(TARGET).elf: $(OFILES)
	$(CC) $(OFILES) $(LDFLAGS) -o $@

clean:
	rm -f $(OFILES) $(TARGET).elf $(TARGET).dol
