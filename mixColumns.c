
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

uint8_t xtime(uint8_t);
uint8_t state[16];          //Bytes containing current state in every step


void init_state(){
  /*
  state[0] = 0x63;
  state[1] = 0x53;
  state[2] = 0xe0;
  state[3] = 0x8c;
  state[4] = 0x09;
  state[5] = 0x60;
  state[6] = 0xe1;
  state[7] = 0x04;
  state[8] = 0xcd;
  state[9] = 0x70;
  state[10] = 0xb7;
  state[11] = 0x51;
  state[12] = 0xba;
  state[13] = 0xca;
  state[14] = 0xd0;
  state[15] = 0xe7;
  */

  state[0] = 0x63;
  state[1] = 0x09;
  state[2] = 0xcd;
  state[3] = 0xba;
  state[4] = 0x53;
  state[5] = 0x60;
  state[6] = 0x70;
  state[7] = 0xca;
  state[8] = 0xe0;
  state[9] = 0xe1;
  state[10] = 0xb7;
  state[11] = 0xd0;
  state[12] = 0x8c;
  state[13] = 0x04;
  state[14] = 0x51;
  state[15] = 0xe7;
}

void printMatrix(){

  for(int i = 0; i < 4; i=i+1){
      printf("( %x ", state[i*4]); printf(" %x ", state[(i*4)+1]); printf(" %x ", state[(i*4)+2]); printf(" %x ) \n", state[(i*4)+3]);
  }

}

/**
 * Phase of the algorithm mixing columns of state
 * For more info see NIST AES specification
 */
void MixColumns() {
	for (int i = 0; i < 4; i++) {
		uint8_t temp[4];
		memcpy(temp, &(state[i*4]), 4);
		state[i*4] = xtime(temp[0]) ^ (xtime(temp[1]) ^ temp[1]) ^ temp[2] ^ temp[3];
		state[i*4+1] = temp[0] ^ xtime(temp[1]) ^ (xtime(temp[2]) ^ temp[2]) ^ temp[3];
		state[i*4+2] = temp[0] ^ temp[1] ^ xtime(temp[2]) ^ (xtime(temp[3]) ^ temp[3]);
		state[i*4+3] = (xtime(temp[0]) ^ temp[0]) ^ temp[1] ^ temp[2] ^ xtime(temp[3]);
	}
}

/**
 * Inverse function to MixColumns
 * For More info see NIST AES specification
 */
void InvMixColumns() {
	for (int i = 0; i < 4; i++) {
		uint8_t lookup[4][4];
		for (int j = 0; j < 4; j++) {
			lookup[j][0] = state[i*4+j];
			lookup[j][1] = xtime(lookup[j][0]);
			lookup[j][2] = xtime(lookup[j][1]);
			lookup[j][3] = xtime(lookup[j][2]);
		}

		state[i*4] = (lookup[0][3] ^ lookup[0][2] ^ lookup[0][1]) ^ (lookup[1][3] ^ lookup[1][1] ^ lookup[1][0]) ^ (lookup[2][3] ^ lookup[2][2] ^ lookup[2][0]) ^ (lookup[3][3] ^ lookup[3][0]);
		state[i*4+1] = (lookup[0][3] ^ lookup[0][0]) ^ (lookup[1][3] ^ lookup[1][2] ^ lookup[1][1]) ^ (lookup[2][3] ^ lookup[2][1] ^ lookup[2][0]) ^ (lookup[3][3] ^ lookup[3][2] ^ lookup[3][0]);
		state[i*4+2] = (lookup[0][3] ^ lookup[0][2] ^ lookup[0][0]) ^ (lookup[1][3] ^ lookup[1][0]) ^ (lookup[2][3] ^ lookup[2][2] ^ lookup[2][1]) ^ (lookup[3][3] ^ lookup[3][1] ^ lookup[3][0]);
		state[i*4+3] = (lookup[0][3] ^ lookup[0][1] ^ lookup[0][0]) ^ (lookup[1][3] ^ lookup[1][2] ^ lookup[1][0]) ^ (lookup[2][3] ^ lookup[2][0]) ^ (lookup[3][3] ^ lookup[3][2] ^ lookup[3][1]);
	}
}

/**
 * Function used to make multiplication in Gaulois field (finite field),
 * multitplies number by 2
 * @param num number to be multiplied by 2
 * @returns number multiplied by 2
 */
inline uint8_t xtime(uint8_t num) {
	if (num / 128 == 0)
		return (num << 1);
	else
		return ((num << 1) ^ 0x1b);
}

int main(){

  init_state();

  printf("=====   ORIGINAL MATRIX   ===== \n");
  printMatrix();
  MixColumns();
  printf("=====   MIX COLUMNS MATRIX   ===== \n");
  printMatrix();
  InvMixColumns();
  printf("=====   INV COLUMNS MATRIX   ===== \n");
  printMatrix();


}
