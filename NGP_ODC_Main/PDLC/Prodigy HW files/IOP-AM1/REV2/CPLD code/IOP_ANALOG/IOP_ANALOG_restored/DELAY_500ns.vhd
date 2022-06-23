LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY DELAY_500ns IS
	PORT
	(
				
		data	: IN STD_LOGIC ;
		q		: OUT STD_LOGIC 
	);
END DELAY_500ns;

ARCHITECTURE SYN OF delay_500ns IS

begin


q <= transport data after 500ns;	


END SYN; 

