#include <stdio.h>
#include <wiringPi.h>

//  LED Pin - wiringPi pin 0 is BCM_GPIO 17.

int main (int argc, char const *argv[])
{
	int ledPin =  atoi(argv[1]);

	if (wiringPiSetup()  == -1)
        exit (1) ;

	pinMode (ledPin, OUTPUT);
	digitalWrite (ledPin, LOW); //  Turn pin off

	return 0 ;
}



 
