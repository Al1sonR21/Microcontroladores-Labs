#include <pic14/pic12f683.h>

unsigned int __at 0x2007 __CONFIG = (_MCLRE_OFF&_WDTE_OFF);

void esperar(unsigned int tiempo_espera);
void lfsr_generar(unsigned short *numero_aleatorio);

void main(void) {

    unsigned short valor_aleatorio = 1;
	unsigned int duracion = 3000;
    unsigned short resultado_dado = 0;
	unsigned short *puntero_aleatorio = &valor_aleatorio;

    TRISIO = 0b00001000; // GPIO0, GPIO1, GPIO2 y GPIO4 como salidas; GPIO3 como entrada
    GPIO = 0b00000000; // Apagar todos los LEDs al inicio


    while (1) {
        if (GP3) {
            switch (resultado_dado) {
            case 6: // Se encienden 3 pares de LEDs (3x2=6)
                GPIO = 0b00001101; // GPIO0, GPIO2 y GPIO4 encendidos
				// Apagar los LEDS:
                esperar(duracion);
                GPIO = 0b00000000;
                break;
            case 5: // Se encienden 2 pares de LEDs y el central (2x2+1=5)
                GPIO = 0b00010101; // Pares GPIO0 y GPIO2 encendidos y central GPIO4
				// Apagar los LEDS:
                esperar(duracion);
                GPIO = 0b00000000;
                break;
            case 4: // Se encienden 2 pares de LEDs (2x2=4)
                GPIO = 0b00000101; // Pares GPIO0 y GPIO2 encendidos
                // Apagar los LEDS:
				esperar(duracion);
                GPIO = 0b00000000;
                break;
            case 3: // Se encienden 1 par de LEDs y el central (2+1=3)
                GPIO = 0b00010001; // Par GPIO0  y central GPIO4 encendidos
                // Apagar los LEDS:
				esperar(duracion);
                GPIO = 0b00000000;
                break;
            case 2: // Se enciende 1 par de LEDs (2)
                GPIO = 0b00000001; // Par GPIO0 encendido
                // Apagar los LEDS:
				esperar(duracion);
                GPIO = 0b00000000;
                break;
            case 1: // Se enciende el central (1)
                GPIO = 0b00010000; // central GPIO4 encendido
                // Apagar los LEDS:
				esperar(duracion);
                GPIO = 0b00000000;
                break;
            default:
                break;
            }
        } else { //llamada a funcion (LFSR):
            GPIO = 0b00000000; 
            lfsr_generar(puntero_aleatorio);
            resultado_dado = 1 + (valor_aleatorio % 6); //Recalcula el valor
        }
    }
}

void esperar(unsigned int tiempo_espera) { // funcion de espera
    unsigned int i, j;
    for (i = 0; i < tiempo_espera; i++) {
        for (j = 0; j < 256; j++);
    }
}

void lfsr_generar(unsigned short *numero_aleatorio) { //Metodo LFSR
    if ((*numero_aleatorio) & 1) {
        (*numero_aleatorio) >>= 1;
        (*numero_aleatorio) ^= (1<<15) + (1<<14) + (1<<12) + (1<<3);
    } else {
        (*numero_aleatorio) >>= 1;
    }
}
