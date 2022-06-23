library ieee;

use ieee.std_logic_1164.all;

ENTITY NOR_4 IS
	PORT
	(
		data0		: IN STD_LOGIC ;
		data1		: IN STD_LOGIC ;
		data2		: IN STD_LOGIC ;
		data3		: IN STD_LOGIC ;
		result		: OUT STD_LOGIC 
	);
END NOR_4;

architecture arc of NOR_4 is

signal a : std_logic ;

begin

a <= data0 or data1 or data2 or data3; 

result <= not a;

end arc; 
