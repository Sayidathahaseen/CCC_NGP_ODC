LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY ADC_CONV IS
	PORT
	(
		IN1		 : IN STD_LOGIC ;
		CLOCK    : IN STD_LOGIC ;
		ADC_CONV : OUT STD_LOGIC 
	);
END ADC_CONV;


ARCHITECTURE SYN OF adc_conv IS

begin 
process(IN1)
begin
if ((IN1'EVENT))
then
ADC_CONV <= '0';
wait until rising_edge(CLOCK);
ADC_CONV <= '1';
end if;
end process;
END SYN;
