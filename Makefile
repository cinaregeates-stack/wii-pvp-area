TARGET := Wii-PvP-Arena
CC := powerpc-eabi-gcc
CFLAGS := -g -O2 -Wall -DGEKKO -mrvl -mcpu=750 -meabi -mhard-float
LDFLAGS := -logc -lm

all: $(TARGET).dol

$(TARGET).dol: $(TARGET).elf
	powerpc-eabi-objcopy -O binary $< $@

$(TARGET).elf: src/main.o
	$(CC) src/main.o $(LDFLAGS) -o $@

clean:
	rm -f src/main.o $(TARGET).elf $(TARGET).dol
