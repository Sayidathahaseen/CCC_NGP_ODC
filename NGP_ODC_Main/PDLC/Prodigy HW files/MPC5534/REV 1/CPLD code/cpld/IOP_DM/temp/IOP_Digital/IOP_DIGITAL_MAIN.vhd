library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity IOP_DIGITAL_MAIN is
	port (
		  B_MPC_ADDR  	: in std_logic_vector(13 downto 0);
		  MPC_CS3n    	: in std_logic;
		  MPC_OEn		: in std_logic;
		  MPC_RD_WRn	: in std_logic;
		  MPC_WE0n		: in std_logic;
		  MPC_WE1n		: in std_logic; 
		  
		  CPLD_CLK		: in std_logic; 
		  CPLD_RST_OUTn : in std_logic; 

		  
		  DI1_OUT		: in std_logic; 
		  DI2_OUT		: in std_logic; 
		  DI3_OUT		: in std_logic; 
		  DI4_OUT		: in std_logic; 
		  DI5_OUT		: in std_logic; 
		  DI6_FQ1_OUT	: in std_logic; 
		  DI7_FQ2_OUT	: in std_logic; 
		  DI8_FQ3_OUT 	: in std_logic;
		  
		  
		  B_MPC_DATA	: inout std_logic_vector(15 downto 0);	  
		  
		  
		  DI1_ACTIVE	: out std_logic; 
		  DI1_FAULT		: out std_logic;
		  
		  DI2_ACTIVE	: out std_logic;
		  DI2_FAULT		: out std_logic; 
		   
		  DI3_ACTIVE	: out std_logic; 
		  DI3_FAULT		: out std_logic;
		  
		  DI4_ACTIVE	: out std_logic;
		  DI4_FAULT		: out std_logic;
		  
		  DI5_ACTIVE	: out std_logic;
		  DI5_FAULT		: out std_logic;
		  
		  DI6_FQ1_ACTIVE	: out std_logic;
		  DI6_FQ1_FAULT		: out std_logic;
		  
		  DI7_FQ2_ACTIVE	: out std_logic;
		  DI7_FQ2_FAULT		: out std_logic;
		  
		  DI8_FQ3_ACTIVE	: out std_logic;
		  DI8_FQ3_FAULT		: out std_logic;
		 
		  DI9_FAULT			: out std_logic;
		  DI10_FAULT		: out std_logic;
		  
		  D01_FAULT			: out std_logic;
		  D02_FAULT			: out std_logic;
		  D03_FAULT			: out std_logic;
		  D04_FAULT			: out std_logic;
		  D05_FAULT			: out std_logic;
		  D06_FAULT     	: out std_logic 
		  
		  );
		 
end IOP_DIGITAL_MAIN;


architecture MAIN of IOP_DIGITAL_MAIN is

signal CPLD_READ_ADD_BUF: std_logic_vector (13 downto 0);
signal B_MPC_DATA_int : STD_LOGIC_VECTOR(15 downto 0);
signal MPC_CS3n_dly: std_logic;
signal CPLD_WR,CPLD_RD: std_logic;
signal LED_REGISTER1,LED_REGISTER2 : STD_LOGIC_VECTOR(15 downto 0);


begin

B_MPC_DATA <= B_MPC_DATA_int when CPLD_RD = '1' else "ZZZZZZZZZZZZZZZZ";

DI1_ACTIVE <= LED_REGISTER1(0);
DI1_FAULT <= LED_REGISTER2(0);
		  
DI2_ACTIVE <= LED_REGISTER1(1);
DI2_FAULT <= LED_REGISTER2(1); 
		   
DI3_ACTIVE <= LED_REGISTER1(2);
DI3_FAULT <= LED_REGISTER2(2);
  
DI4_ACTIVE <= LED_REGISTER1(3);
DI4_FAULT <= LED_REGISTER2(3);
		  
DI5_ACTIVE <= LED_REGISTER1(4);
DI5_FAULT <= LED_REGISTER2(4);
  
DI6_FQ1_ACTIVE <= LED_REGISTER1(5);
DI6_FQ1_FAULT <= LED_REGISTER2(5);
  
DI7_FQ2_ACTIVE <= LED_REGISTER1(6);
DI7_FQ2_FAULT <= LED_REGISTER2(6);
  
DI8_FQ3_ACTIVE <= LED_REGISTER1(7);
DI8_FQ3_FAULT <= LED_REGISTER2(7);
 
DI9_FAULT <= LED_REGISTER2(8);
DI10_FAULT <= LED_REGISTER2(9);
		  
D01_FAULT <= LED_REGISTER2(10);
D02_FAULT <= LED_REGISTER2(11);
D03_FAULT <= LED_REGISTER2(12);
D04_FAULT <= LED_REGISTER2(13);
D05_FAULT <= LED_REGISTER2(14);
D06_FAULT <= LED_REGISTER2(15);

process(CPLD_CLK,CPLD_RST_OUTn) 
begin
if CPLD_RST_OUTn = '0' then
	B_MPC_DATA_int <= (others => '0');
elsif CPLD_CLK'event and CPLD_CLK = '1' then
	if CPLD_RD = '1' then  
		if CPLD_READ_ADD_BUF = "00000000000001" then 
			B_MPC_DATA_int <= LED_REGISTER2;
		elsif CPLD_READ_ADD_BUF = "00000000000011" then 
			B_MPC_DATA_int <= LED_REGISTER1;
		else
			B_MPC_DATA_int <= "1010101010101010";
		end if;		
	end if;
end if;
end process;

process(CPLD_CLK) 
begin
if CPLD_CLK'event and CPLD_CLK = '1' then 
	MPC_CS3n_dly <= MPC_CS3n;		  
end if;
end process;		  

process(CPLD_CLK,CPLD_RST_OUTn) 
begin
if CPLD_RST_OUTn = '0' then
	CPLD_READ_ADD_BUF <= (others => '0');
elsif CPLD_CLK'event and CPLD_CLK = '1' then
	if MPC_CS3n_dly = '1' and MPC_CS3n = '0' then  
		CPLD_READ_ADD_BUF <= B_MPC_ADDR;
	end if;
end if;
end process;

process(CPLD_CLK,CPLD_RST_OUTn) 
begin
if CPLD_RST_OUTn = '0' then
	CPLD_WR <= '0';
elsif CPLD_CLK'event and CPLD_CLK = '1' then
	if MPC_CS3n_dly = '1' and MPC_CS3n = '0' then  
		if MPC_RD_WRn = '0' then
			CPLD_WR <= '1';
		else 
			CPLD_WR <= '0';
		end if;
	elsif MPC_CS3n = '1' then
		CPLD_WR <= '0';
	end if;
end if;
end process;

process(CPLD_CLK,CPLD_RST_OUTn) 
begin
if CPLD_RST_OUTn = '0' then
	CPLD_RD <= '0';
elsif CPLD_CLK'event and CPLD_CLK = '1' then
	if MPC_CS3n_dly = '1' and MPC_CS3n = '0' then  
		if MPC_RD_WRn = '1' then
			CPLD_RD <= '1';
		else 
			CPLD_RD <= '0';
		end if;
	elsif MPC_CS3n = '1' then
		CPLD_RD <= '0';
	end if;
end if;
end process;

process(CPLD_CLK,CPLD_RST_OUTn) 
begin
if CPLD_RST_OUTn = '0' then
	LED_REGISTER2 <= (others => '0');
elsif CPLD_CLK'event and CPLD_CLK = '1' then
	if CPLD_READ_ADD_BUF = "00000000000001" and CPLD_WR = '1' then  
		LED_REGISTER2 <= B_MPC_DATA;
	end if;
end if;
end process;

process(CPLD_CLK,CPLD_RST_OUTn) 
begin
if CPLD_RST_OUTn = '0' then
	LED_REGISTER1 <= (others => '0');
elsif CPLD_CLK'event and CPLD_CLK = '1' then
	if CPLD_READ_ADD_BUF = "00000000000011" and CPLD_WR = '1' then  
		LED_REGISTER1 <= B_MPC_DATA;
	end if;
end if;
end process;

end main;


