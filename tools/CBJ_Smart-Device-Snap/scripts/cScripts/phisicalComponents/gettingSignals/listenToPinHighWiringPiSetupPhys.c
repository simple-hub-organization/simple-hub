#include <stdio.h>
#include <wiringPi.h>

int main(int argc, char const *argv[])
{
	int buttonPin = atoi(argv[1]);

	if (wiringPiSetupPhys()  == -1)
		exit (1) ;

	pinMode (buttonPin, INPUT) ;

	pullUpDnControl (buttonPin, PUD_UP) ;

    while (digitalRead (buttonPin) == HIGH ){   // Wait for button press
    	delay (10) ;
    }

 	exit(0);
}