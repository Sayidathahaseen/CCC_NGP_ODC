
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity health_cpld is 
port ( 

	MPC_CLK_OUT						: in STD_LOGIC; 
	MPC_ENG_CLK						: in STD_LOGIC; 
	n_MPC_RESET						: in STD_LOGIC; 
	n_RST_OUT						: in STD_LOGIC; 
	
	I_AM_HEALTHY					: in STD_LOGIC; 
	APP1_OPN_EN						: in STD_LOGIC; 
	APP2_OPN_EN						: in STD_LOGIC; 
	TAKE_CONTROL					: in STD_LOGIC; 
	
	ESC1_WDI_CPLD					: in STD_LOGIC; 
	ESC1_GPIO						: in STD_LOGIC; 
	
	ESC2_WDI_CPLD					: in STD_LOGIC; 
	ESC2_GPIO						: in STD_LOGIC; 
	
	IN_CONTROL						: in STD_LOGIC; 
	PEER_IN_CONTROL					: in STD_LOGIC; 
	IOP_TO_IOP_SRH1					: inout STD_LOGIC; 
	IOP_TO_IOP_SRH2					: inout STD_LOGIC;
	IOP_TO_IOP_SRH3					: inout STD_LOGIC;
	IOP_TO_IOP_SRH4					: inout STD_LOGIC;
	
	HEALTHY							: out STD_LOGIC;
	HEALTHY_INV						: out STD_LOGIC;
	READY_LED						: out STD_lOGIC;
	CONTROL							: out STD_lOGIC;
	CONTROL_INV						: out STD_lOGIC;
	ACTIVE_LED						: out STD_lOGIC

 );
end health_cpld;


architecture health_cpld_arch of health_cpld is 

signal HEALTH_D_FF_CLR,HEALTH_OUT,CONTROL_D_FF_CLR,CONTROL_OUT : STD_LOGIC;
signal ESC1_WDI,ESC2_WDI,ESC_WDI : STD_LOGIC:= '1';
signal APP_COMM,WRAP_SIGNAL,WRAP_SIGNAL2 : STD_LOGIC;
signal WD_COUNTER,WD_COUNTER2 : STD_LOGIC_VECTOR(8 downto 0):= "000000000"; 
signal APP1_ENABLE,APP2_ENABLE : STD_LOGIC;
signal TEST_COUNTER : STD_LOGIC_VECTOR(2 downto 0);

begin

HEALTHY_INV<= not HEALTH_OUT;
HEALTHY <= HEALTH_OUT;
READY_LED <= HEALTH_OUT;

APP1_ENABLE <= APP1_OPN_EN and ESC1_GPIO;
APP2_ENABLE <= APP2_OPN_EN and ESC2_GPIO;


APP_COMM <= APP1_ENABLE or APP2_ENABLE;
ESC_WDI <= (not ESC1_WDI) or (not ESC2_WDI);

HEALTH_D_FF_CLR <= I_AM_HEALTHY and n_MPC_RESET and ESC_WDI and APP_COMM;

process(HEALTH_D_FF_CLR,TAKE_CONTROL)
begin
if HEALTH_D_FF_CLR = '0' then 
	HEALTH_OUT <= '0';
elsif TAKE_CONTROL'event and TAKE_CONTROL = '1' then
	HEALTH_OUT <= '1';
end if;
end process;

CONTROL <= CONTROL_OUT;
CONTROL_INV <= not CONTROL_OUT;
ACTIVE_LED <= CONTROL_OUT;

CONTROL_D_FF_CLR <= not PEER_IN_CONTROL;

process(CONTROL_D_FF_CLR,TAKE_CONTROL)
begin
if CONTROL_D_FF_CLR = '0' then 
	CONTROL_OUT <= '0';
elsif TAKE_CONTROL'event and TAKE_CONTROL = '1' then
	if PEER_IN_CONTROL = '0' or IN_CONTROL = '0' then 
		CONTROL_OUT <= '1';
	end if;
end if;
end process;

--ENG clock frequency is 634KHz considering that sytem clock is divided
--to the maximum value.
--count gives the value for 1 ms.
process(MPC_ENG_CLK,n_RST_OUT)
begin
if n_RST_OUT = '0' then
	WD_COUNTER <= "000000000";
elsif MPC_ENG_CLK'event and MPC_ENG_CLK = '1' then
	if WD_COUNTER = "1001111010" or (WRAP_SIGNAL = '1' and ESC1_WDI_CPLD = '1') then
		WD_COUNTER <= "000000000";
	else
		WD_COUNTER <= WD_COUNTER + '1';
	end if;
end if;
end process;

process(MPC_ENG_CLK,n_RST_OUT)
begin
if n_RST_OUT = '0' then
	WRAP_SIGNAL <='0';
elsif MPC_ENG_CLK'event and MPC_ENG_CLK = '1' then
	if WD_COUNTER = "1001111010" then
		WRAP_SIGNAL <= '0';
	elsif WD_COUNTER = "000000000" then
		WRAP_SIGNAL <= '1';
	end if;
end if;
end process;

process(MPC_ENG_CLK,n_RST_OUT)
begin
if n_RST_OUT = '0' then
	ESC1_WDI <='0';
elsif MPC_ENG_CLK'event and MPC_ENG_CLK = '1' then
	if (WRAP_SIGNAL = '1' and ESC1_WDI_CPLD = '1') or ESC1_WDI = '1' then
		ESC1_WDI <= '0';
	elsif WRAP_SIGNAL = '0' and ESC1_WDI_CPLD/= '1' then
	  	ESC1_WDI <= '1';
	end if;
end if;
end process;	
	
--ENG clock frequency is 634KHz considering that sytem clock is divided
--to the maximum value.
--count gives the value for 1 ms.
process(MPC_ENG_CLK,n_RST_OUT)
begin
if n_RST_OUT = '0' then
	WD_COUNTER2 <= "000000000";
elsif MPC_ENG_CLK'event and MPC_ENG_CLK = '1' then
	if WD_COUNTER2 = "1001111010" or (WRAP_SIGNAL2 = '1' and ESC2_WDI_CPLD = '1') then
		WD_COUNTER2 <= "000000000";
	else
		WD_COUNTER2 <= WD_COUNTER2 + '1';
	end if;
end if;
end process;

process(MPC_ENG_CLK,n_RST_OUT)
begin
if n_RST_OUT = '0' then
	WRAP_SIGNAL2 <='0';
elsif MPC_ENG_CLK'event and MPC_ENG_CLK = '1' then
	if WD_COUNTER2 = "1001111010" then
		WRAP_SIGNAL2 <= '0';
	elsif WD_COUNTER2 = "000000000" then
		WRAP_SIGNAL2 <= '1';
	end if;
end if;
end process;

process(MPC_ENG_CLK,n_RST_OUT)
begin
if n_RST_OUT = '0' then
	ESC2_WDI <='0';
elsif MPC_ENG_CLK'event and MPC_ENG_CLK = '1' then
	if (WRAP_SIGNAL2 = '1' and ESC2_WDI_CPLD = '1') or ESC2_WDI = '1' then
		ESC2_WDI <= '0';
	elsif WRAP_SIGNAL2 = '0' and ESC2_WDI_CPLD/= '1' then
	  	ESC2_WDI <= '1';
	end if;
end if;
end process;	

--test process
process(MPC_ENG_CLK,n_RST_OUT)
begin
if n_RST_OUT = '0' then
	TEST_COUNTER <= "000";
elsif MPC_ENG_CLK'event and MPC_ENG_CLK = '1' then
	TEST_COUNTER <= TEST_COUNTER + '1';
end if;
end process;

process(MPC_ENG_CLK,n_RST_OUT)
begin
if n_RST_OUT = '0' then
	IOP_TO_IOP_SRH3 <= '0';
elsif MPC_ENG_CLK'event and MPC_ENG_CLK = '1' then
	if TEST_COUNTER = "111" then
		IOP_TO_IOP_SRH3 <= '1';
	else 
		IOP_TO_IOP_SRH3 <= '0';
	end if;
end if;
end process;


end health_cpld_arch;