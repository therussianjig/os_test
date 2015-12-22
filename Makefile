all: myos

myos: bin/boot.o bin/kernel.o
	i686-elf-gcc -T src/linker.ld -o bin/myos.bin -ffreestanding -O2 -nostdlib bin/boot.o bin/kernel.o -lgcc


bin/boot.o: src/boot.s
	 i686-elf-as src/boot.s -o bin/boot.o	

bin/kernel.o: src/kernel.c
	i686-elf-gcc -c src/kernel.c -o bin/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra


clean:
	rm -f bin/*.o
	rm -f bin/*.bin
	rm -f bin/*.iso 
