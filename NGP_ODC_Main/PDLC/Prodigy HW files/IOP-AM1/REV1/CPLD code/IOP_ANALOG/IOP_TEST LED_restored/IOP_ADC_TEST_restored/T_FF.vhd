LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY T_FF IS
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC 
	);
END T_FF;


architecture BEHAVE of T_FF is
signal z : std_logic ;

begin
process(clock,aclr)
begin
if aclr = '1' then z <= '0';
else if rising_edge(clock) then
z <= not z;
end if;
end if;
q <= transport z after 500ns;
end process;
end BEHAVE; 
