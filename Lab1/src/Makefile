FAMILY = -mpic14
MCU = -p12f683
CC = sdcc
LD = sdcc
CFLAGS = -I. -I/usr/local/share/sdcc/non-free/include
TARGET = programa

# Archivos fuente
SRCS = programa.c

# Reglas de construcción
all: $(TARGET).hex

$(TARGET).ihx: $(SRCS)
	$(CC) --use-non-free $(FAMILY) $(MCU) $(CFLAGS) -o $(TARGET) $(SRCS)

$(TARGET).hex: $(TARGET).ihx
	packihx $(TARGET).ihx > $(TARGET).hex

flash: $(TARGET).hex
	pk2cmd -PPIC$(MCU: -p%=%) -F$(TARGET).hex -M -T -R

clean:
	rm -f *.c~ *.h~ *.o *.elf *.hex *.asm *.lst *.cod *.ihx *.lk *.map *.rst
