CC=.\clang.exe
C_OPTS=-target cdm -S -O0

ASM=cocas
ASM_OPTS=-t cdm16


SRCS = $(wildcard src/*.c)
ASM_FILES = $(patsubst %.c,%.asm,$(SRCS))

.DEFAULT: main.img

%.asm: %.c
	$(CC) $(C_OPTS) -o $@ $+


main.img: $(ASM_FILES) start.asm
	$(ASM) $(ASM_OPTS) -o $@ $+
