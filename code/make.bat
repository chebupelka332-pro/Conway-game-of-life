./clang -S ./src/parser.c -o ./src/parser.asm -O3
:: When you compile parser.c, you must to fix some compiler mistakes (replace all lsb with too large imm with lsw)
cocas -t cdm16 -o ./build/program.img ./src/start/asm ./src/parser.asm