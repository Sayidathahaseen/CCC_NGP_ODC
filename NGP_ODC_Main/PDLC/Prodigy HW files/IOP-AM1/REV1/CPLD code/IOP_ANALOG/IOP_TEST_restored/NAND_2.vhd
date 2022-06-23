LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY NAND_2 IS
	PORT
	(
		data0		: IN STD_LOGIC ;
		data1		: IN STD_LOGIC ;
		result		: OUT STD_LOGIC 
	);
END NAND_2;

architecture arc_nand of NAND_2 is

begin

result <= data0 nand data1;

end arc_nand;