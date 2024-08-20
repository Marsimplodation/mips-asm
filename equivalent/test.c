#include <stdio.h> // for printf
int main() {
	printf("Hello Mips\n"); //glibc handles the syscall for us
	
	int * buffer = ((int[]){1, 2, 3, 70, 5});
	int buffer_len = 5;
	int sum = 0;
	for(int i = 0; i < buffer_len; ++i) {
		sum += buffer[0];
		buffer = buffer + 1; //adds +4 (sizeof(int)) to the buffer
	}

	return sum;
}
