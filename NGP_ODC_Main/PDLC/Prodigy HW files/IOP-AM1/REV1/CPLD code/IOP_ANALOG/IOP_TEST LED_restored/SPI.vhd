LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY SPI IS
	PORT
	(
		
		
		
		En		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		SDATA,SCLK		: OUT STD_LOGIC
	);
END SPI;
ARCHITECTURE SYN OF spi IS
type state_type is (idle,ready,send,over);
signal state : state_type;


signal data_a : std_logic_vector (15 downto 0);
begin
data_a <= data;

process(clock)
variable index : integer range 0 to 16 := 0;
begin

if(rising_edge(clock)) then
case state is
when idle =>
	index := 0;
	state <= ready;
when ready =>
	SCLK <='0';
	SDATA <= data_a(index);
	state <= send;
when send =>
	SCLK <='1';
	index := index + 1; 
    if (index > 15) then
    state <= over; 
    else
    state <= ready;
    end if ;  
when over =>
if(En = '1') then
state <= idle; 
else
state <= over;
end if ;    
end case;
end if ;
end process;   
END SYN;