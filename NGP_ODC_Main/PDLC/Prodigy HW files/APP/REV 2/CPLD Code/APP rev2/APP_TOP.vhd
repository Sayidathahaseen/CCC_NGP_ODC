library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity app_top is
	port (
		 PWR_GOOD_DDR3,
		 PGOOD_VDD_CPU,		
		 CPU_HRESET_REQ_bar, 
		 COP_HRESET_bar, 
		 COP_SRESET_bar, 
		 COP_TRST_bar, 
		 CLK_IN_25MHz,
		 CPLD_RESET_bar : IN STD_LOGIC;
		 
		 CPU_HRESET_bar, 
		 CPU_SRESET_bar, 
		 CPU_TRST_bar, 
		 DDR3_RESET, 
		 SGMII_PHY_RESET_bar,
		 ENET_PHY_RESET_bar,
		 TSEC_PHY_RESET_bar, 
		 MUX_EN1_bar, 
		 MUX_EN2_bar,
		 MUX_SEL1, 
		 MUX_SEL2, 
		 BUF_EN_bar,
		 PWR_ON_GVDD,
		 PWR_OFF_VDD_CPU, 
		 SD_1588_CLK_EN, 
		 PGOOD_SYS,
		 RTS_EN_bar : OUT STD_logic
		 );
		 
end app_top;


architecture power_seq of app_top is

signal HIGHAFTER100US: std_logic ;
signal HIGHAFTER200US: std_logic ;
signal HIGHAFTER200US_PLUS_ONECLK: std_logic ;
signal HIGHAFTER300US: std_logic ;

signal HRESET_HIGHAFTER40uS: std_logic ;
signal SRESET_HIGHAFTER120nS: std_logic ;
signal TRESET_HIGHAFTER120nS: std_logic ;
signal HRESET_HIGHAFTER40US_PLUS_ONECLK: std_logic ;
signal HRESET_HIGHAFTER140uS: std_logic ;


signal CLK_300US: std_logic;
signal CLK_140US: std_logic;
signal CLK_120nS: std_logic;
signal CLK_120nS_2: std_logic;


begin 

process (clk_in_25Mhz, CPLD_RESET_bar)

begin

if CPLD_RESET_bar = '0' then
	
			
		 CPU_HRESET_bar <= '0';
		 CPU_SRESET_bar <= '0';
		 CPU_TRST_bar <= '0';
		 DDR3_RESET <= '1';
		 SGMII_PHY_RESET_bar <= '0';
		 ENET_PHY_RESET_bar <= '0';
		 TSEC_PHY_RESET_bar <= '0';
		 MUX_EN1_bar <= '0';
		 MUX_EN2_bar <= '0';
		 MUX_SEL1 <= '0';
		 MUX_SEL2 <= '0';
		 BUF_EN_bar <= '1'; -- Changed on 21 Nov 2011
		 PWR_ON_GVDD <= '0';
		 PWR_OFF_VDD_CPU <= 'Z';
		 SD_1588_CLK_EN <= 'Z';
		 PGOOD_SYS <= '0';
		 RTS_EN_bar <= '1';
		 
		 		
else


if PGOOD_VDD_CPU = '1' then 
	
	PWR_ON_GVDD <= '1';
	
if PWR_GOOD_DDR3 = '1' then
	
PGOOD_SYS <= '1';

MUX_EN1_bar <= '0';
MUX_EN2_bar <= '0';
RTS_EN_bar <= '0';
BUF_EN_bar <= '0'; -- Added on 21_Nov 2011

--After 100uS
CPU_TRST_bar <= COP_TRST_bar and HIGHAFTER100US and 

TRESET_HIGHAFTER120nS;
CPU_SRESET_bar <= COP_SRESET_bar and HIGHAFTER100US and 

SRESET_HIGHAFTER120nS;

--After 200uS
CPU_HRESET_bar <= COP_HRESET_bar and HIGHAFTER200uS and 

HRESET_HIGHAFTER40uS; -- Drive HIGH after 200uS
DDR3_RESET <= COP_HRESET_bar nand (HIGHAFTER200uS and 

HRESET_HIGHAFTER40uS); -- Dreive LOW after 200uS


--After 200uS+1
MUX_SEL1 <= COP_HRESET_bar and HIGHAFTER200US_PLUS_ONECLK and 

HRESET_HIGHAFTER40US_PLUS_ONECLK ;
MUX_SEL2 <= COP_HRESET_bar and HIGHAFTER200US_PLUS_ONECLK and 

HRESET_HIGHAFTER40US_PLUS_ONECLK ;
--BUF_EN_bar <= COP_HRESET_bar and HIGHAFTER200US_PLUS_ONECLK and HRESET_HIGHAFTER40US_PLUS_ONECLK ;
-- Commented BUF_EN_bar on 21 Nov 2011


--After 300uS
SGMII_PHY_RESET_bar <= COP_HRESET_bar and HIGHAFTER300uS and 

HRESET_HIGHAFTER140uS ; -- Drive HIGH after 300uS
ENET_PHY_RESET_bar <= COP_HRESET_bar and HIGHAFTER300uS and 

HRESET_HIGHAFTER140uS; -- Drive HIGH after 300uS
TSEC_PHY_RESET_bar <= COP_HRESET_bar and HIGHAFTER300uS and 

HRESET_HIGHAFTER140uS; -- Drive HIGH after 300uS

end if;
end if;
end if;

end process;

	

-- Max Delay to be generated = 300uS
-- CLK_IN_25MHz frequency = 25MHz
-- HIGHAFTER100US is asserted 100uS after CPLD_RESET_bar is deasserted
-- HIGHAFTER200US is asserted 200uS after CPLD_RESET_bar is deasserted
-- HIGHAFTER200US_PLUS_ONECLK is asserted 200.040uS after CPLD_RESET_bar is deasserted;
-- HIGHAFTER300US is asserted 200uS after CPLD_RESET_bar is deasserted



process (CLK_IN_25MHz, CPLD_RESET_bar) 

variable COUNT300US:std_logic_vector(12 downto 0);
	
begin

 if CPLD_RESET_bar ='0' then
	COUNT300US := "0000000000000"; -- 300uS count register
	CLK_300US <= '0'; -- 300uS counter output 
	HIGHAFTER100uS <= '0';
	HIGHAFTER200uS <= '0';
	HIGHAFTER200US_PLUS_ONECLK <= '0';
	HIGHAFTER300uS <= '0';
	
 
 elsif	CLK_IN_25MHz'EVENT and CLK_IN_25MHz = '1'then
	
	COUNT300US := COUNT300US + '1';
	
		if  COUNT300US >= "0100111000100" then
			HIGHAFTER100uS <= '1';
		end if;
		
		
	
		if  COUNT300US >= "1001110001000" then
			HIGHAFTER200uS <= '1';
		end if;
		
		
		if  COUNT300US >= "1001110001001" then
			HIGHAFTER200US_PLUS_ONECLK <= '1';
		end if;
					
		
		if  COUNT300US = "1110101001100" then
			CLK_300US <= not CLK_300US;
			COUNT300US := "0000000000000";
			HIGHAFTER300uS <= '1';
		end if;
		
		
end if;
end process;

 --Delay of 140uS for CPU_HRESET_bar

process(CLK_IN_25MHz,COP_HRESET_bar)

variable COUNT140US:std_logic_vector(11 downto 0);

begin

if  COP_HRESET_bar ='0'  then
	COUNT140US := "000000000000"; -- 40uS count register
	CLK_140US <= '0'; -- 40uS counter output
	HRESET_HIGHAFTER40uS <= '0';	
	HRESET_HIGHAFTER40US_PLUS_ONECLK <= '0' ;
	HRESET_HIGHAFTER140uS <= '0' ;

elsif	CLK_IN_25MHz'EVENT and CLK_IN_25MHz = '1'then
	
	COUNT140US := COUNT140US + '1';
				
		if  COUNT140US >= "001111101000" then
			HRESET_HIGHAFTER40uS <= '1';
		end if;

		if  COUNT140US >= "001111101001" then
			HRESET_HIGHAFTER40US_PLUS_ONECLK <= '1';
		end if;

		if  COUNT140US >= "110110101100" then
			CLK_140US <= not CLK_140US;
			HRESET_HIGHAFTER140uS <= '1';
			COUNT140US := "000000000000";
		end if;

end if;
		
end process;



-- Delay of 120nS for CPU_SRESET_bar

process(CLK_IN_25MHz,COP_SRESET_bar)

variable COUNT120nS:std_logic_vector(1 downto 0);

begin

if  COP_SRESET_bar ='0'  then
	COUNT120nS := "00"; -- 120nS count register
	CLK_120nS <= '0'; -- 120nS counter output
	SRESET_HIGHAFTER120nS <= '0';

elsif	CLK_IN_25MHz'EVENT and CLK_IN_25MHz = '1'then
	
	COUNT120nS := COUNT120nS + '1';
				
		if  COUNT120nS >= "11" then
			CLK_120nS <= not CLK_120nS;
			SRESET_HIGHAFTER120nS <= '1';
			COUNT120nS := "00";
		end if;

end if;
		
end process;


-- Delay for 120nS for CPU_TRST_bar 

 process(CLK_IN_25MHz,COP_TRST_bar)

variable COUNT120nS_2:std_logic_vector(1 downto 0);

begin

if  COP_TRST_bar ='0'  then
	COUNT120nS_2 := "00"; -- 120nS count register
	CLK_120nS_2 <= '0'; -- 120nS counter output
	TRESET_HIGHAFTER120nS <= '0';

elsif	CLK_IN_25MHz'EVENT and CLK_IN_25MHz = '1'then
	
	COUNT120nS_2 := COUNT120nS_2 + '1';
				
		if  COUNT120nS_2 >= "11" then
			CLK_120nS_2 <= not CLK_120nS_2;
			TRESET_HIGHAFTER120nS <= '1';
			COUNT120nS_2 := "00";
		end if;

end if;
		
end process;



end power_seq;
		  
		  
		  
		 