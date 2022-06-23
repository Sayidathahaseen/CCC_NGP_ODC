
--Note on addressing: Addr lines 16-30 used, thus missing low bit for 15 total.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

entity IOP_Analog_Proto is
	port (
			
			AICLK :			in std_logic;
			ADC_D :			in std_logic_vector(0 to 15);	-- 'to' to preserve bit ordering
			ADC_BUSY :		in std_logic;
			SDO_ADC_A :		in std_logic;
			SDO_ADC_B :		in std_logic;
			SDO_ADC_C :		in std_logic;
			SDO_ADC_D :		in std_logic;
			SDO_DAC1 :		in std_logic;
			SDO_DAC2 :		in std_logic;
			SDO_DAC3 :		in std_logic;
			SDO_DAC4 :		in std_logic;

			ANB :				in std_logic;			
			FTC_BD1 :		in std_logic;
			FTC_BD2 :		in std_logic;
			FTC_BD3 :		in std_logic;
			FTC_BD4 :		in std_logic;
			
			RB_DL_A :		in std_logic;
			RB_DL_B :		in std_logic;
			RB_DL_C :		in std_logic;
			RB_DL_D :		in std_logic;			
			
			READY_FBn     :  	in std_logic;
			PEER_READY_FB :		in std_logic;
			IN_CONTROL      :		in std_logic;
			PEER_CONTROL_FB :		in std_logic;

			P_ADDR :		in std_logic_vector(14 downto 0);
			P_WE0 :		in std_logic;
			P_WE1 :		in std_logic;
			P_OEn :		in std_logic;
			P_CSn :		in std_logic;
			P_RD_Wn :	in std_logic;
			
			RST_INn :		in std_logic;
			
			P_DATA :			inout std_logic_vector(0 to 15);
			IRQ :				inout std_logic;

			HA1 :				buffer std_logic;
			HA2 :				buffer std_logic;
			HA3 :				buffer std_logic;
			HA4 :				buffer std_logic;
			HB1 :				out std_logic;
			HB2 :				out std_logic;
			HB3 :				out std_logic;
			HB4 :				buffer std_logic;
			H5 :				buffer std_logic;
			ADC_RESET :		buffer std_logic;
			ADC_PD :			buffer std_logic;
			ADC_CONVSTn :	buffer std_logic;
			ADC_RDn :		buffer std_logic;
			ADC_CSn :		buffer std_logic;
			SDIN_DAC1 :		out std_logic;
			SCK_DAC1 :		out std_logic;
			CLEAR1 :			out std_logic;
			LATCH1 :			out std_logic;
			SDIN_DAC2 :		out std_logic;
			SCK_DAC2 :		out std_logic;
			CLEAR2 :			out std_logic;
			LATCH2 :			out std_logic;
			SCK_DAC3 :		out std_logic;
			SDIN_DAC3 :		out std_logic;
			SDIN_DAC4 :		out std_logic;
			CLEAR3 :			out std_logic;
			LATCH4 :			out std_logic;
			LATCH3 :			out std_logic;
			CLEAR4 :			out std_logic;
			SCK_DAC4 :		out std_logic;
			
			P_SDI :			out std_logic;
			P_CLOCK :		out std_logic;
			P_LE :			out std_logic;
			P_OE    :      out std_logic;
			
			MUX_A3 :			out std_logic;
			MUX_A2 :			out std_logic;
			MUX_A1 :			out std_logic;
			MUX_A0 :			out std_logic;
			MUX_A4 :			out std_logic;
			
			CNV2 :		out std_logic;
			CNV1 :		buffer std_logic;
			CNV3 :		out std_logic;
			CNV4 :		out std_logic;
			SCK_ADC :		out std_logic;
			SDIN_ADC :		inout std_logic  --out

-- Unassigned		
--			TP4
--			IOP_SPARE1
--			IOP_SPARE2
--			IOP_SPARE3
--			EXTRA29 : out std_logic;
--			EXTRA28 : out std_logic;
--			EXTRA27 : out std_logic;
--			EXTRA26 : out std_logic;
--			EXTRA25 : out std_logic;
--			EXTRA24 : out std_logic
--			EXTRA23
--			EXTRA22
--			EXTRA16 : out std_logic;
--			EXTRA15 : out std_logic;
--			EXTRA14 : out std_logic;
--			EXTRA13 : out std_logic;
--			EXTRA12 : out std_logic;
--			EXTRA11
--			EXTRA10
--			EXTRA09
--			EXTRA08
--			EXTRA21
--			EXTRA20
--			EXTRA19
--			EXTRA18
--			EXTRA17
--			EXTRA_CLK2 : out std_logic
--			EXTRA07
--			EXTRA06
--			EXTRA05
--			EXTRA04
--			EXTRA03
--			EXTRA02
--			EXTRA01
--			EXTRA_CLK1
--			TP3
--			TP1

		  );
		 
end IOP_Analog_Proto;

architecture main of IOP_Analog_Proto is

-- Set up attributes for defeating optimizations, must be applied to signals
-- Usage: attribute <X> of <signal Y> : signal is true;
attribute preserve: boolean;		                           	-- preserve register during synth
attribute dont_merge: boolean;	                           	-- dont merge register during synth
attribute noprune:  boolean;			                           -- preserve fan out during synth
attribute syn_keep: boolean;		                           	-- keep wire or combinational logic through synth
attribute dont_retime: boolean;		                           -- turn off retiming optimizations
attribute dont_replicate: boolean;	                           -- turn off register replication through synth

-- Signal definitions
signal P_DATA_signal   : std_logic_vector(15 downto 0); 
signal MPCDataInternal : std_logic_vector(15 downto 0);       -- Internal Register for Data
--signal CS3Delayed: std_logic;
signal IOPStatusReg    : std_logic_vector(15 downto 0);
signal IOPIDReg        : std_logic_vector(15 downto 0);
signal LEDFaultReg     : std_logic_vector(15 downto 0);
signal AIStatusReg     : std_logic_vector(15 downto 0);
signal AICommandReg    : std_logic_vector(15 downto 0);
signal AIDataReg       : std_logic_vector(15 downto 0);
signal AIHartMuxReg    : std_logic_vector(15 downto 0);
signal AOCommandReg    : std_logic_vector(15 downto 0);
signal AOCh1HighReg    : std_logic_vector(15 downto 0);
signal AOCh1LowReg     : std_logic_vector(15 downto 0);
signal AOCh2HighReg    : std_logic_vector(15 downto 0);
signal AOCh2LowReg     : std_logic_vector(15 downto 0);
signal AOCh3HighReg    : std_logic_vector(15 downto 0);
signal AOCh3LowReg     : std_logic_vector(15 downto 0);
signal AOCh4HighReg    : std_logic_vector(15 downto 0);
signal AOCh4LowReg     : std_logic_vector(15 downto 0);
signal AOCh1HighRBReg  : std_logic_vector(15 downto 0);
signal AOCh2HighRBReg  : std_logic_vector(15 downto 0);
signal AOCh3HighRBReg  : std_logic_vector(15 downto 0);
signal AOCh4HighRBReg  : std_logic_vector(15 downto 0);
signal AOCh1LowRBReg   : std_logic_vector(15 downto 0);
signal AOCh2LowRBReg   : std_logic_vector(15 downto 0);
signal AOCh3LowRBReg   : std_logic_vector(15 downto 0);
signal AOCh4LowRBReg   : std_logic_vector(15 downto 0);
signal AORelayStatusReg: std_logic_vector(15 downto 0);
signal AOCh1PowerRBReg : std_logic_vector(15 downto 0);
signal AOCh2PowerRBReg : std_logic_vector(15 downto 0);
signal AOCh3PowerRBReg : std_logic_vector(15 downto 0);
signal AOCh4PowerRBReg : std_logic_vector(15 downto 0);
signal AOCh13V3HealthRBReg : std_logic_vector(15 downto 0);
signal AOCh23V3HealthRBReg : std_logic_vector(15 downto 0);
signal AOCh33V3HealthRBReg : std_logic_vector(15 downto 0);
signal AOCh43V3HealthRBReg : std_logic_vector(15 downto 0);
signal ConfigData1RBReg : std_logic_vector(13 downto 0);
signal ConfigData2RBReg : std_logic_vector(13 downto 0);
signal ConfigData3RBReg : std_logic_vector(13 downto 0);
signal ConfigData4RBReg : std_logic_vector(13 downto 0);

signal SerialCLK        : std_logic;
signal LEDTrigger       : std_logic;
signal EnableP_CLOCK    : std_logic;
signal LEDCommInProgress: std_logic;
signal InputEnb         : std_logic;

signal AOCommandStart          : std_logic;
signal AOStateMachineInProgress: std_logic;
signal EnableDACClocks         : std_logic;
signal DACCommInProgress       : std_logic;

signal EnableSCK_ADC             : std_logic;
signal AORBInputEnable           : std_logic;
signal AORBStateMachineInProgress: std_logic;
signal AICommandStart            : std_logic;
signal AICommandEmptyFIFO        : std_logic;
signal AIStateMachineComplete    : std_logic;

signal AI_FIFO_Read       : std_logic;
signal AI_FIFO_Write      : std_logic;
signal AI_FIFO_ASyncClear : std_logic;
signal AI_FIFO_Empty      : std_logic;
signal AI_FIFO_Full       : std_logic;
signal AIFormattedData    : std_logic_vector(0 to 15);
signal AIFifoAdvance      : std_logic;
signal Config_DatainEnb   : std_logic;

signal WriteRegFlag       : std_logic;
signal ReadRegFlag        : std_logic;

  signal AORBChannel      : integer range 0 to 3;
  signal AORBMachineState : integer range 0 to 7 := 0;
  signal AORBBitIndex     : integer range 0 to 32;
  signal AORBCommandReg   : std_logic_vector(0 to 13);
  signal wordcnt          : integer range 0 to 8;
  signal BitCount         : integer range 0 to 30;
  signal Bit_cnt2         : integer range 0 to 16;
  signal LEDTransmitState : integer range 0 to 16;
  signal max_index        : integer range 0 to 32;
  signal BitCount_config  : integer range 0 to 13;

constant ConfigReg_ch0 : std_logic_vector(13 downto 0) := "11110001001000";    
constant ConfigReg_ch1 : std_logic_vector(13 downto 0) := "11110011001000";
constant ConfigReg_ch2 : std_logic_vector(13 downto 0) := "11110101001000"; 
constant ConfigReg_ch3 : std_logic_vector(13 downto 0) := "11110111001000"; 

--signal CSInv1: std_logic;
--signal CSInv2: std_logic;
--signal WRInv1: std_logic;
--signal RDInv1: std_logic;
--signal WRInv2: std_logic;
--signal RDInv2: std_logic;
--signal WRDeglitch: std_logic;
--signal RDDeglitch: std_logic;

-- Apply Attributes to Signals
--attribute syn_keep of CSInv1 : signal is true;
--attribute syn_keep of CSInv2 : signal is true;
--attribute syn_keep of CS3Delayed : signal is true;

--attribute syn_keep of WRInv1 : signal is true;
--attribute syn_keep of WRInv2 : signal is true;
--attribute syn_keep of WRDeglitch : signal is true;

--attribute syn_keep of RDInv1 : signal is true;
--attribute syn_keep of RDInv2 : signal is true;
--attribute syn_keep of RDDeglitch : signal is true;

--component AI_FIFO
--	PORT
--	(
--		aclr		: IN STD_LOGIC  := '0';
--		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
--		rdclk		: IN STD_LOGIC ;
--		rdreq		: IN STD_LOGIC ;
--		wrclk		: IN STD_LOGIC ;
--		wrreq		: IN STD_LOGIC ;
--		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
--		rdempty		: OUT STD_LOGIC ;
--		wrfull		: OUT STD_LOGIC 
--	);
--end component;

component AI_FIFO_S
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		rdreq		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
end component;
begin

-- Update I/O
IRQ <= 'Z'; -- Tristate MPC Interrupt Request output

IOPStatusReg(15) <= ANB;
IOPStatusReg(14) <= IN_CONTROL;
IOPStatusReg(13) <= PEER_CONTROL_FB;
IOPStatusReg(12) <= READY_FBn;
IOPStatusReg(11) <= PEER_READY_FB;
IOPStatusReg(10) <= LEDCommInProgress;
IOPStatusReg(9)  <= DACCommInProgress;
IOPStatusReg(8 downto 0) <= "000000000";

IOPIDReg(3) <= FTC_BD1;
IOPIDReg(2) <= FTC_BD2;
IOPIDReg(1) <= FTC_BD3;
IOPIDReg(0) <= FTC_BD4;
IOPIDReg(7 downto 4) <= "0000";	-- PLD Version
IOPIDReg(11 downto 8) <= "0001";	-- IOP PCB Version = 1
IOPIDReg(15 downto 12) <= "1000";	-- IOP CPLD File ID

AIStatusReg(15) <= AIStateMachineComplete;
AIStatusReg(14) <= not AI_FIFO_Empty;
AIStatusReg(13) <= not AI_FIFO_Full;
AIStatusReg(12) <= DACCommInProgress;
AIStatusReg(11) <= AORBStateMachineInProgress;
AIStatusReg(10) <= LEDCommInProgress;
AIStatusReg(9 downto 0) <= "0000000000";

AORelayStatusReg(15) <=	RB_DL_A;
AORelayStatusReg(14) <=	RB_DL_B;
AORelayStatusReg(13) <=	RB_DL_C;
AORelayStatusReg(12) <=	RB_DL_D;
AORelayStatusReg(11 downto 0) <= "000000000000";

P_DATA_signal <= P_DATA(0)& P_DATA(1)& P_DATA(2)& P_DATA(3)& P_DATA(4)& P_DATA(5)& P_DATA(6)& P_DATA(7)&
                 P_DATA(8)& P_DATA(9)& P_DATA(10)& P_DATA(11)& P_DATA(12)& P_DATA(13)& P_DATA(14)& P_DATA(15);


--EXTRA16 <= WriteRegFlag;
--EXTRA15 <= AI_FIFO_READ;
--EXTRA14 <= ReadRegFlag;
--EXTRA13 <= AICLK;
--EXTRA12 <= AIFifoAdvance;
--EXTRA_CLK2 <= AICLK;


-- BUS COMMUNICATION TO MPC5534
-- Drive data to external bus when in read mode and output is enabled.
P_DATA <= MPCDataInternal when (P_CSn = '0' and P_OEn = '0')
				else "ZZZZZZZZZZZZZZZZ";

-- Delay CS through 2 buffers for settling logic.
--CSInv1 <= not P_CSn;
--CSInv2 <= not CSInv1;
--CS3Delayed <= CSInv2;
-- End Delay CSd

-- Delay RD through 2 buffers for settling logic.
--RDInv1 <= not AI_FIFO_Read;
--RDInv2 <= not RDInv1;
--RDDeglitch <= RDInv2 and AI_FIFO_Read;

-- End Delay RD

-- Delay RD through 2 buffers for settling logic.
--WRInv1 <= not AI_FIFO_Write;
--WRInv2 <= not WRInv1;
--WRDeglitch <= WRInv2 and AI_FIFO_Write;
-- End Delay RD

MPCReadRegister:
process(AICLK,RST_INn)
variable ReadAddressBuffer: std_logic_vector (14 downto 0) := "111111111111111";
begin
if RST_INn = '0' then
	--Reset State '0's
	MPCDataInternal <= (others => '0');
	ReadAddressBuffer := "111111111111111";
elsif AICLK'event and AICLK = '1' then -- Rising Clock Edge
	--Detect Bus interaction - Read
	if P_CSn = '0' and P_OEn = '0' then
		ReadAddressBuffer := P_ADDR;
		ReadRegFlag <= '1';	-- Debug indicate read access
		--Note on addressing: Addr lines 16-30 used, thus missing LSB for 15 total bits.
		case ReadAddressBuffer is
			when "000000000000000" => MPCDataInternal <= IOPStatusReg; 			-- EBI Addr = 30000000
			when "100000000000000" => MPCDataInternal <= IOPIDReg; 				-- EBI Addr = 30000002
			when "000000010000000" => MPCDataInternal <= LEDFaultReg;			-- EBI Addr = 30000100
			when "000000000001000" => MPCDataInternal <= AIStatusReg;			-- EBI Addr = 30001000
			when "000000001001000" => 														-- EBI Addr = 30001200
				--Read next word from FIFO
					MPCDataInternal <= AIDataReg;
					AIFifoAdvance <= '1';
			when "000000011001000" => MPCDataInternal <= AIHartMuxReg;			-- EBI Addr = 30001300
			when "100000010000100" => MPCDataInternal <= AOCh1HighReg;			-- EBI Addr = 30002102
			when "010000010000100" => MPCDataInternal <= AOCh1LowReg;			-- EBI Addr = 30002104
			when "110000010000100" => MPCDataInternal <= AOCh2HighReg;			-- EBI Addr = 30002106
			when "001000010000100" => MPCDataInternal <= AOCh2LowReg;			-- EBI Addr = 30002108
			when "101000010000100" => MPCDataInternal <= AOCh3HighReg;			-- EBI Addr = 3000210A
			when "011000010000100" => MPCDataInternal <= AOCh3LowReg;			-- EBI Addr = 3000210C
			when "111000010000100" => MPCDataInternal <= AOCh4HighReg;			-- EBI Addr = 3000210E
			when "000100010000100" => MPCDataInternal <= AOCh4LowReg;			-- EBI Addr = 30002110
			when "100000001000100" => MPCDataInternal <= AOCh1HighRBReg;		-- EBI Addr = 30002202
			when "010000001000100" => MPCDataInternal <= AOCh2HighRBReg;		-- EBI Addr = 30002204
			when "110000001000100" => MPCDataInternal <= AOCh3HighRBReg;		-- EBI Addr = 30002206
			when "001000001000100" => MPCDataInternal <= AOCh4HighRBReg;		-- EBI Addr = 30002208
			when "100000011000100" => MPCDataInternal <= AOCh1LowRBReg;			-- EBI Addr = 30002302
			when "010000011000100" => MPCDataInternal <= AOCh2LowRBReg;			-- EBI Addr = 30002304
			when "110000011000100" => MPCDataInternal <= AOCh3LowRBReg;			-- EBI Addr = 30002306
			when "001000011000100" => MPCDataInternal <= AOCh4LowRBReg;			-- EBI Addr = 30002308
			when "100000000100100" => MPCDataInternal <= AOCh1PowerRBReg;		-- EBI Addr = 30002402
			when "010000000100100" => MPCDataInternal <= AOCh2PowerRBReg;		-- EBI Addr = 30002404
			when "110000000100100" => MPCDataInternal <= AOCh3PowerRBReg;		-- EBI Addr = 30002406
			when "001000000100100" => MPCDataInternal <= AOCh4PowerRBReg;		-- EBI Addr = 30002408
			when "000000010100100" => MPCDataInternal <= AORelayStatusReg;		-- EBI Addr = 30002500	
			---new registers
			when "100000010100100" => MPCDataInternal <= AOCh13V3HealthRBReg;   -- EBI Addr = 30002502
			when "010000010100100" => MPCDataInternal <= AOCh23V3HealthRBReg;   -- EBI Addr = 30002504
			when "110000010100100" => MPCDataInternal <= AOCh33V3HealthRBReg;   -- EBI Addr = 30002506
			when "001000010100100" => MPCDataInternal <= AOCh43V3HealthRBReg;	  -- EBI Addr = 30002508	
			
			when "100000001100100" => MPCDataInternal <= "00"&ConfigData1RBReg; -- EBI Addr = 30002602	
			when "010000001100100" => MPCDataInternal <= "00"&ConfigData2RBReg; -- EBI Addr = 30002604	
			when "110000001100100" => MPCDataInternal <= "00"&ConfigData3RBReg; -- EBI Addr = 30002606	
			when "001000001100100" => MPCDataInternal <= "00"&ConfigData4RBReg; -- EBI Addr = 30002608	
	
			when others => MPCDataInternal <= "1001000001000001";					-- Other EBI Addr, debug error pattern
		end case;
	else
		AIFifoAdvance <= '0';
		ReadAddressBuffer := "111111111111111";
		ReadRegFlag <= '0';	-- Debug indicate read access
	end if;
end if;
end process MPCReadRegister;

MPCWriteRegister:
process(AICLK,RST_INn)
variable WriteShot: std_logic := '0';
variable WriteAddressBuffer: std_logic_vector (14 downto 0) := "111111111111111";
begin
if RST_INn = '0' then
	--Reset State '0's
	LEDFaultReg <= (others => '0');
	AIHartMuxReg <= (others => '0');
	AICommandReg <= (others => '0');
	AOCh1HighReg <= (others => '0');
	AOCh1LowReg <= (others => '0');
	AOCh2HighReg <= (others => '0');
	AOCh2LowReg <= (others => '0');
	AOCh3HighReg <= (others => '0');
	AOCh3LowReg <= (others => '0');
	AOCh4HighReg <= (others => '0');
	AOCh4LowReg <= (others => '0');
	--Reset Triggers
	LEDTrigger <= '0';
	AOCommandStart <= '0';
	AI_FIFO_AsyncClear <= '1';
	WriteShot :='0';
	WriteAddressBuffer := "111111111111111";
elsif AICLK'event and AICLK = '1' then -- Rising Clock Edge
	--Detect Bus interaction - Write
	if P_CSn = '0' and P_RD_Wn = '0' then 
		-- Write Operation, wait for Write Enable
		if P_WE0 = '0' then
			--Wait one cycle then trigger write
			if WriteShot = '1' then
				WriteAddressBuffer := P_ADDR; -- Capture Write Address
				WriteRegFlag <= '1';	-- Debug indicate Write access
				case WriteAddressBuffer is
					when "000000010000000" => 
						LEDFaultReg <= P_DATA_signal; 										-- EBI Addr = 30000100
						LEDTrigger <= '1';		-- Trigger shift out to LED Driver
					when "000000010001000" => 										-- EBI Addr = 30001100
						AICommandStart <= P_DATA_signal(15);
						AI_FIFO_AsyncClear <= P_DATA_signal(14);
					when "000000011001000" => AIHartMuxReg <= P_DATA_signal;		-- EBI Addr = 30001300
					when "000000010000100" => 										-- EBI Addr = 30002100
						AOCommandStart <= P_DATA_signal(15);
					when "100000010000100" => AOCh1HighReg <= P_DATA_signal;		-- EBI Addr = 30002102
					when "010000010000100" => AOCh1LowReg <= P_DATA_signal;		-- EBI Addr = 30002104
					when "110000010000100" => AOCh2HighReg <= P_DATA_signal;		-- EBI Addr = 30002106
					when "001000010000100" => AOCh2LowReg <= P_DATA_signal;		-- EBI Addr = 30002108
					when "101000010000100" => AOCh3HighReg <= P_DATA_signal;		-- EBI Addr = 3000210A
					when "011000010000100" => AOCh3LowReg <= P_DATA_signal;		-- EBI Addr = 3000210C
					when "111000010000100" => AOCh4HighReg <= P_DATA_signal;		-- EBI Addr = 3000210E
					when "000100010000100" => AOCh4LowReg <= P_DATA_signal;		-- EBI Addr = 30002110
					when others => null;												      --do nothing
				end case;
			else
				WriteShot := '1';
			end if;
		end if;
	else
		-- Reset Triggers after write complete
		LEDTrigger <= '0';
		AOCommandStart <= '0';
		AICommandStart <= '0';
		AI_FIFO_AsyncClear <= '0';
		WriteShot := '0';
		WriteAddressBuffer := "111111111111111";
		WriteRegFlag <= '0';	-- Debug indicate Write access
	end if;
end if;
end process MPCWriteRegister;
-- END BUS COMMUNICATION TO MPC5534

--SERIAL COMMUNICATIONS
SerialClocks:
-- Generate 1 MHz Clock for DAC and Shift Register
process(AICLK,RST_INn)

variable SerialCLKCounter: integer range 0 to 31;

begin

	if RST_INn = '0' then
		-- Reset State, 0 counter, idle high clock
		SerialCLKCounter := 0; 
		SerialCLK <= '0';
		P_CLOCK <= '0';
		SCK_DAC1 <= '0';
		SCK_DAC2 <= '0';
		SCK_DAC3 <= '0';
		SCK_DAC4 <= '0';
		SCK_ADC <= '0';
	elsif AICLK'event and AICLK = '1' then
		-- Sync to rising edge of cpld clock
		SerialCLKCounter := SerialCLKCounter+1;	                       -- Increment clock counter
		if SerialCLKCounter >= 20 then
		-- Every 20 ticks, toggle clock and reset counter
			SerialCLK <= not SerialCLK;
			SerialCLKCounter := 0;
		end if;
		
		--Output LED Clock if enabled
		if EnableP_CLOCK = '1' then
			P_CLOCK <= SerialCLK;
		else
			P_CLOCK <= '0';
		end if;		

		--Output AO_ADC Clock if enabled
		if EnableSCK_ADC = '1' then
			SCK_ADC <= SerialCLK;
		else
			SCK_ADC <= '0';
		end if;		
		
		--Output DAC Clock if enabled
		if EnableDACClocks = '1' then
			SCK_DAC1 <= SerialCLK;
			SCK_DAC2 <= SerialCLK;
			SCK_DAC3 <= SerialCLK;
			SCK_DAC4 <= SerialCLK;
		else
			SCK_DAC1 <= '0';
			SCK_DAC2 <= '0';
			SCK_DAC3 <= '0';
			SCK_DAC4 <= '0';
		end if;		
	end if;	
end process SerialClocks;

-- LED Shift Register Communication Algorithm
UpdateShiftRegisters:
process(RST_INn, SerialCLK)

--variable LEDTransmitState: integer range 0 to 3;	      -- For Transmit state machine
variable LEDBitIndex: integer range 0 to 31;		         -- Index for bit shifting

begin
	if RST_INn = '0' then
	-- Idle signals at reset
		EnableP_CLOCK <= '0'; 	                           -- Disable clock output
		P_LE <= '0';			            		            -- Idle Register Clock
		P_SDI <= '0';		     	        		               -- Idle Serial Input
		P_OE <= '1';
		LEDTransmitState <= 0;
		LEDBitIndex := 0; 	   		                     -- Reset counter to full
		LEDCommInProgress <= '0';	                        -- Transmission is not in progress
		
	  elsif LEDTrigger = '1' then
           LEDTransmitState <= 1;
	
	elsif SerialCLK'event and SerialCLK = '0' then	  
		
		case LEDTransmitState is
		    when 0 =>                                     -- Idle state
		       P_OE <= '0'; 
			when 1 => 	                                   -- Transmit Data
			   EnableP_CLOCK <= '1';
			   P_OE <= '0';                                -- Disabling o/p enable.
				if LEDBitIndex < 16  then                   -- Transmit 16 bits
					P_SDI <= LEDFaultReg(LEDBitIndex);       -- Output bit  
					LEDBitIndex := LEDBitIndex + 1;	        -- Increcment index
				else
				-- Advance State and disable clock
					EnableP_CLOCK <= '0';                    -- Disable Shift Clock
					LEDBitIndex := 0;
					P_SDI <= '0';					              -- Idle Serial Input
					P_LE <= '1';
					LEDTransmitState <= 2;
				end if;
			when 2 =>                                     -- Transmission complete, latch output to ADC register.
				P_LE <= '0';					                -- Idle Register Clock				
				LEDTransmitState <= 3;
		    when 3 => 
		  		P_OE <= '0';                               -- Enabling o/p enable.
				LEDCommInProgress <= '0';    	             -- Transmission Complete, lower flag   
				LEDTransmitState <= 0;
			when others =>
				null;
		end case;
	end if;
end process UpdateShiftRegisters;	
-- END LED Shift Register


-- AO DAC Communication Algorithm
UpdateAODACs:
process(RST_INn, AOCommandStart, SerialCLK)

variable DACTransmitState: integer range 0 to 7;	    -- For Transmit state machine
variable DACBitIndex: integer range 0 to 31;		       -- Index for bit shifting

begin

	if RST_INn = '0' then
	-- Idle signals at reset
		EnableDACClocks <= '0'; 	                     -- Disable clock output
		SDIN_DAC1 <= '0';					                  -- Idle Serial Input
		CLEAR1 <= '1';						                  -- Disable clear
		CLEAR2 <= '1';
		CLEAR3 <= '1';
		CLEAR4 <= '1';
		LATCH1 <= '0';						                  -- Idle Latch
		LATCH2 <= '0';
		LATCH3 <= '0';
		LATCH4 <= '0';
		DACTransmitState := 0;		                     -- Reset Transmit flag
		DACBitIndex := 0; 			                     -- Reset counter to full
		DACCommInProgress <= '0';
	elsif AOCommandStart = '1' and DACTransmitState = 0 then
	-- DAC transmission has been triggered by write to AOCommandReg
	-- Trigger is reset after write has been completed.
		DACTransmitState := 1; 	                        -- Start transmission state machine
		DACBitIndex := 8;			                        -- Set index for first bit
		DACCommInProgress <= '1';
	elsif SerialCLK'event and SerialCLK = '0' then
	-- Falling edge of DAC clock, handle state machine
		case DACTransmitState is
			when 0 =>	                                 -- Idle State, do nothing
				null; 
			when 1 => 	                                 -- Transmit Data Low
				CLEAR1 <= '0';
				CLEAR2 <= '0';
				CLEAR3 <= '0';
				CLEAR4 <= '0';				
				EnableDACClocks <= '1';		               -- Enable Shift Clock
				-- Transmit 8 high bits of command
				SDIN_DAC1 <= AOCh1HighReg(DACBitIndex);	-- Output bit
				SDIN_DAC2 <= AOCh2HighReg(DACBitIndex);	-- Output bit
				SDIN_DAC3 <= AOCh3HighReg(DACBitIndex);	-- Output bit
				SDIN_DAC4 <= AOCh4HighReg(DACBitIndex);	-- Output bit
				DACBitIndex := DACBitIndex + 1;			   -- Increcment index				
				if DACBitIndex > 15 then	               -- Advance state to send high 8 bits
					DACBitIndex := 0;
					DACTransmitState := 2;
				end if;
			when 2 => 	-- Transmit Data High
				if DACBitIndex < 16 then	               -- Advance state to send high 8 bits
					-- Transmit 16 low bits of command
					SDIN_DAC1 <= AOCh1LowReg(DACBitIndex);	-- Output bit
					SDIN_DAC2 <= AOCh2LowReg(DACBitIndex);	-- Output bit
					SDIN_DAC3 <= AOCh3LowReg(DACBitIndex);	-- Output bit
					SDIN_DAC4 <= AOCh4LowReg(DACBitIndex);	-- Output bit
					DACBitIndex := DACBitIndex + 1;			-- Increcment index
				else
				-- Last bit shifted out, end disable shift clock and advance state
					DACTransmitState := 3;
					EnableDACClocks <= '0';
				end if;
			when 3 => 					                  	-- Store to register
				LATCH1 <= '1';				                  -- Store data in storage register
				LATCH2 <= '1';
				LATCH3 <= '1';
				LATCH4 <= '1';
				DACTransmitState := 4;	                  -- Advance State
			when 4 => 	                                 -- Control Transmission complete
				LATCH1 <= '0';					               -- Idle Register Clock
				LATCH2 <= '0';
				LATCH3 <= '0';
				LATCH4 <= '0';
				DACBitIndex := 0;
				DACTransmitState := 0;
				DACCommInProgress <= '0';
			when others =>
				null;
		end case;
	end if;
end process UpdateAODACs;	

-- END AO DAC Communication

-- AO Readback Sampling Algorithm
AORB:
process(RST_INn, AICommandStart, SerialCLK)
begin

	if RST_INn = '0' then
	-- Idle signals at reset
		EnableSCK_ADC <= '0'; 	                        -- Disable clock output
		SDIN_ADC <= '0';
		CNV1     <= '0';
		CNV2     <= '0';
		CNV3     <= '0';
		CNV4     <= '0';
		AORBInputEnable <= '0';
		AORBMachineState <= 0;
		AORBStateMachineInProgress <= '0';
		wordcnt <= 0;
	elsif (AICommandStart = '1' ) then                 --and AORBMachineState = 0 then
		AORBMachineState <= 1;
		AORBChannel <=0;
		AORBBitIndex <=0;
		AORBStateMachineInProgress <= '1';
		CNV1   <= '1';                                 -- Providing rising edge in CNVx to make ADC in conversion phase.
		CNV2   <= '1';
		CNV3   <= '1';
		CNV4   <= '1';
	elsif SerialCLK'event and SerialCLK = '0' then    -- Falling edge of Serial clock, handle state machine
        wordcnt <= wordcnt;	
        EnableSCK_ADC <= '0';
        AORBInputEnable <= '0';
        Config_DatainEnb <= '0';
		  AORBBitIndex  <= 0;
        
		case AORBMachineState is
		   when 0 =>	-- Idle State
	            CNV1   <= '1';                        -- Providing rising edge in CNVx to make ADC in conversion phase.
		         CNV2   <= '1';
		         CNV3   <= '1';
		         CNV4   <= '1';		
				   
		   when 1 =>	
	            CNV1   <= '1';                        -- Providing rising edge in CNVx to make ADC in conversion phase.
		         CNV2   <= '1';
		         CNV3   <= '1';
		         CNV4   <= '1';		
			      AORBMachineState <= 2;
					
			when 2 =>                                  -- States 1 & 2 together keeps ADC in conversion phase for more than 3.2 us(max.
			      CNV1   <= '1';                       -- Providing rising edge in CNVx to make ADC in conversion phase.
		         CNV2   <= '1';
		         CNV3   <= '1';
		         CNV4   <= '1';	 
				  AORBMachineState <= 3;                -- duration needed for the ADC to convert the data)
				  
			when 3 =>
			-- Form output stream
				if AORBChannel = 0 then
					AORBCommandReg <= ConfigReg_ch0;     -- Loading ADC configuration data.
				elsif AORBChannel = 1 then
					AORBCommandReg <= ConfigReg_ch1;
				elsif AORBChannel = 2 then
					AORBCommandReg <= ConfigReg_ch2;
			   elsif AORBChannel = 3 then
					AORBCommandReg <= ConfigReg_ch3;		
				end if;
				
				   
				--Enable chips
            CNV1  <= '0';                           -- To make ADC in Acqusition phase.
				CNV2  <= '0';
				CNV3  <= '0';
				CNV4  <= '0';
				
				if(wordcnt < 2) then                   -- Since valid i/p read data is available from (n+2)th configuration data, 
				   AORBMachineState <= 4;              -- first 2 read operations are dummy.
			   else
				   AORBMachineState <= 5;
			   end if;	
				
			when 4 => 	                              -- Form output stream & Dummy read operation
				 EnableSCK_ADC <= '1';		            -- Enable Shift Clock
				
				 if AORBBitIndex < 14  then            -- Transmit 14 bits
					 SDIN_ADC <= AORBCommandReg(AORBBitIndex);	-- Output configuration data formation    
				 else
					 SDIN_ADC <= '0';
				 end if;
								
				 if AORBBitIndex < max_index then      -- AORBInputEnable is not enabled since it is a dummy read.
					 AORBBitIndex <= AORBBitIndex + 1;
					 AORBMachineState <= 4;
					 wordcnt <= wordcnt;
			    else 			
					 AORBBitIndex    <= 0;
					 AORBMachineState <= 1; 
					 wordcnt <= wordcnt + 1;
				 end if;	 
            CNV1  <= '0';                          -- To make ADC in Acqusition phase.
				CNV2  <= '0';
				CNV3  <= '0';
				CNV4  <= '0';

			when 5 => 	                              -- Form output stream 
				EnableSCK_ADC <= '1';		            -- Enable Shift Clock
				
				    if AORBBitIndex < 14  then         -- Transmit 14 bits
					   SDIN_ADC <= AORBCommandReg(AORBBitIndex);	-- Output bit stream formation
				    else
					   SDIN_ADC <= '0';
				    end if;
								
			    	if AORBBitIndex < max_index then				   
				     	AORBBitIndex <= AORBBitIndex + 1;
				     	AORBMachineState <= 5;   				     	
				        if AORBBitIndex < 16 then
				     	     AORBInputEnable <= '1'; 
				     	     Config_DatainEnb <= '0';     -- Starts i/p read operation.
				     	  else
                       AORBInputEnable <= '0';	    -- End of i/p read operation.			
                       Config_DatainEnb <= '1';
                    end if;       
			      else 
					   AORBBitIndex     <= 0;
					   Config_DatainEnb <= '0';
					   AORBMachineState <= 6; 
				  end if;	 
             CNV1  <= '0';                          -- To make ADC in Acqusition phase.
				 CNV2  <= '0';
				 CNV3  <= '0';
				 CNV4  <= '0';

			when 6 => 	
			   CNV1   <= '1';                          -- Completes Acqusition phase, back to conversion phase. 
		       CNV2   <= '1';
		       CNV3   <= '1';
		       CNV4   <= '1';
				if AORBChannel < 3 then	                -- still channels left to sample
					AORBChannel <= AORBChannel + 1;
					AORBMachineState <= 1;
				else                                    -- Machine complete, idle
					AORBStateMachineInProgress <= '0';
					AORBMachineState <= 0;
				end if;
			when others =>
				null;
		end case;
	end if;
end process AORB;	

max_index <= 30 when (AORBCommandReg(13) = '0') else
             16;  
             
Bit_cnt2 <= 16 when (AORBCommandReg(13) = '0') else
             1;        	
             
InputEnb <= AORBInputEnable or Config_DatainEnb;             

-- Reading data from ADC.
AORBSampleBitstream:
process(AORBInputEnable, SerialCLK)

--variable BitCount: integer range 0 to 16;
variable BitState1: std_logic;
variable BitState2: std_logic;
variable BitState3: std_logic;
variable BitState4: std_logic;

begin
	if InputEnb = '0' then
	-- Idle signals at reset
	  	BitCount <= 15; --max_index;
		BitCount_config <= 13;
	elsif SerialCLK'event and SerialCLK = '1' then
		BitState1 := SDO_ADC_A;
		BitState2 := SDO_ADC_B;
		BitState3 := SDO_ADC_C;
		BitState4 := SDO_ADC_D;
	    
	    if Config_DatainEnb = '1'then                        
		    if AORBChannel = 2 then
	          ConfigData1RBReg(BitCount_config) <= BitState1;  
			 end if;
	 		
			 if AORBChannel = 3 then
	          ConfigData2RBReg(BitCount_config) <= BitState2;
			 end if;
			
	       if AORBChannel = 0 then		
	          ConfigData3RBReg(BitCount_config) <= BitState3;
			 end if;  
			
			 if AORBChannel = 1 then  
	          ConfigData4RBReg(BitCount_config) <= BitState4;               	       
			 end if;  
			
			  BitCount_config <= BitCount_config - 1;			  
	    end if; 
		 
	    if AORBInputEnable = '1' then
		      if AORBChannel = 2 then
			     AOCh1HighRBReg(BitCount) <= BitState1;
			     AOCh2HighRBReg(BitCount) <= BitState2;
			     AOCh3HighRBReg(BitCount) <= BitState3;
			     AOCh4HighRBReg(BitCount) <= BitState4;
		      elsif AORBChannel = 3 then
			     AOCh1LowRBReg(BitCount)  <= BitState1;
			     AOCh2LowRBReg(BitCount)  <= BitState2;
			     AOCh3LowRBReg(BitCount)  <= BitState3;
			     AOCh4LowRBReg(BitCount)  <= BitState4;
		      elsif AORBChannel = 0 then
			     AOCh1PowerRBReg(BitCount) <= BitState1;
			     AOCh2PowerRBReg(BitCount) <= BitState2;
			     AOCh3PowerRBReg(BitCount) <= BitState3;
			     AOCh4PowerRBReg(BitCount) <= BitState4;
		      elsif AORBChannel = 1 then
		        AOCh13V3HealthRBReg(BitCount) <= BitState1;
			     AOCh23V3HealthRBReg(BitCount) <= BitState2;
			     AOCh33V3HealthRBReg(BitCount) <= BitState3;
			     AOCh43V3HealthRBReg(BitCount) <= BitState4;	
		      end if;
		      BitCount <= BitCount -1;
        end if;		
	end if;
end process AORBSampleBitstream;	

-- END SERIAL COMMUNICATIONS

-- Instantiate AI_FIFO megafunction
--AI_FIFO_inst : AI_FIFO PORT MAP (
--		rdclk	 => AICLK,
--		wrclk  => AICLK,
--		data	 => AIFormattedData,
--		rdreq	 => AI_FIFO_Read,
--		aclr	 => AI_FIFO_ASyncClear,
--		wrreq	 => AI_FIFO_Write,
--		rdempty	 => AI_FIFO_Empty,
--		wrfull	 => AI_FIFO_Full,
--		q	 => AIDataReg
--	);

AIFifoOneShotRead:
process(AICLK)
variable OneShot: std_logic := '1';
begin
if AIFifoAdvance = '1' then
	if AICLK'event and AICLK = '0' then
		if OneShot = '1' then
			AI_FIFO_Read <= '1';
			OneShot := '0';
		else
			AI_FIFO_Read <= '0';
		end if;
	end if;
else
	OneShot := '1';
	AI_FIFO_Read <= '0';
end if;
end process AIFifoOneShotRead;


AI_FIFO_S_inst : AI_FIFO_S PORT MAP (
		clock	 => AICLK,
		data	 => AIFormattedData,
		rdreq	 => AI_FIFO_Read,
		sclr	 => AI_FIFO_ASyncClear,
		wrreq	 => AI_FIFO_Write,
		empty	 => AI_FIFO_Empty,
		full	 => AI_FIFO_Full,
		q	 => AIDataReg
	);
-- END AI_FIFO megafunction Instantiation

-- AI ADC Sampling Algorithm
UpdateAIFIFO:
process(AICLK, RST_INn, AICommandStart)

variable ADCMachineState: integer range 0 to 7;	           -- For Transmit state machine
variable ADCTimer: integer range 0 to 20048;               -- Delay timer for settling etc.
variable ADCMuxState: integer range 0 to 23 := 8;
variable ADCMuxVector: std_logic_vector(4 downto 0);
variable ADCShot: std_logic := '0';
-- Note 20MHz AICLK for 50nS tick.

begin

	if RST_INn = '0' then
		ADC_RESET <= '1';
		ADC_PD <= '1';
		ADC_CONVSTn <= '1';
		ADC_RDn <= '1';
		ADC_CSn <= '1';
		ADCMuxVector := conv_std_logic_vector(ADCMuxState,5);
		MUX_A0 <= '0';
		MUX_A1 <= '0';
		MUX_A2 <= '0';
		MUX_A3 <= '1';
		MUX_A4 <= '0';
		AI_FIFO_Write <='0';
		AIFormattedData <= (others => '0');
	elsif AICommandStart = '1' and ADCMachineState = 0 then
	-- ADC Sampling has been started by write to AICommandReg
		ADCMachineState := 1; 				                   -- Start transmission state machine
		AIStateMachineComplete <= '0';	                   -- Signal machine in process
		ADCTimer := 0;
		ADCMuxState := 8;
		ADCMuxVector := conv_std_logic_vector(ADCMuxState,5);
		MUX_A0 <= ADCMuxVector(0);
		MUX_A1 <= ADCMuxVector(1);
		MUX_A2 <= ADCMuxVector(2);
		MUX_A3 <= ADCMuxVector(3);
		MUX_A4 <= ADCMuxVector(4);
	elsif AICLK'event and AICLK = '0' then
	-- Falling Edge of AIClk, handle state machine
		case ADCMachineState is
			when 0 =>	                                     -- Idle State, do nothing
				null; 
			when 1 => 	                                     -- Startup and aquisition and mux settling time
				ADC_CSn <= '0';
				ADC_PD <= '0';
				ADC_RESET <= '0';
				ADC_RDn <= '0';
				ADCShot := '1';
				ADCTimer := ADCTimer +1;
				if ADCTimer >= 280 then		-- 10000
					ADCTimer := 0;
					ADCMachineState := 2;
				end if;
			when 2 => 	                                    -- Start Conversion : 50 nS pulse on convst then wait for completion
				if ADCTimer < 1 then			                  -- 1 tick
					ADC_CONVSTn <= '0';
					ADCTimer := ADCTimer + 1;	
				elsif ADCTimer < 2 then
					ADC_CONVSTn <= '1';
					ADCTimer := ADCTimer + 1;
				elsif ADC_BUSY = '0' then 	                 -- wait until done
					ADCTimer := 0;
					ADCMachineState := 3;
				end if;
			when 3 => 							                 -- Write to FIFO
				ADCTimer := ADCTimer + 1;
				AIFormattedData(0 to 14) <= ADC_D(1 to 15);
				AIFormattedData(15) <= ADC_BUSY;
				if ADCTimer > 2 then			                 -- 2 ticks for bus settling
					ADCMachineState := 4;
					ADCTimer := 0;
					AI_FIFO_Write <= '1';                    -- ready write request
				end if;
			when 4 =>
				AI_FIFO_Write <= '0';                       -- Write Complete, deassert
				if ADCTimer <= 6 and (ADCMuxState = 15 or ADCMuxState = 23) then
					--Enforce 300nS dead time between mux enables
					MUX_A3 <= '0';
					MUX_A4 <= '0';
					ADCTimer := ADCTimer +1;
				elsif ADCMuxState >= 23 then
					-- All channels sampled, end machine
					ADCMachineState := 0;                   -- Base machine state
					ADCMuxState := 8;                       -- Base mux state
					AIStateMachineComplete <= '1';
					ADCMuxVector := conv_std_logic_vector(ADCMuxState,5);
					MUX_A0 <= ADCMuxVector(0);
					MUX_A1 <= ADCMuxVector(1);
					MUX_A2 <= ADCMuxVector(2);
					MUX_A3 <= ADCMuxVector(3);
					MUX_A4 <= ADCMuxVector(4);
					ADCTimer := 0;
				else
					-- Set up for next run
					ADCMachineState := 1;
					ADCMuxState := ADCMuxState + 1;
					ADCMuxVector := conv_std_logic_vector(ADCMuxState,5);
					MUX_A0 <= ADCMuxVector(0);
					MUX_A1 <= ADCMuxVector(1);
					MUX_A2 <= ADCMuxVector(2);
					MUX_A3 <= ADCMuxVector(3);
					MUX_A4 <= ADCMuxVector(4);
					ADCTimer := 0;
				end if;			
			when others =>
				null;
		end case;
	end if;
end process UpdateAIFIFO;
-- END AI ADC Sampling Algorithm	

-- Update AI HART MUX state
UpdateAIHARTMUX:
process(AICLK,RST_INn)

variable OffTimeCounter: integer range 0 to 31;

begin

if RST_INn = '0' then
	HA1 <= '0';
	HA2 <= '0';
	HA3 <= '0';
	HA4 <= '1';
	H5 <= '0';
	OffTimeCounter := 0;
elsif AICLK'event and AICLK = '1' then
	-- Detect transition between muxes
	if (HA4 = '1' and AIHartMuxReg(12) = '1') or (H5 = '1' and AIHartMuxReg(12) = '0') then
		HA4 <= '0';
		H5 <= '0';
		OffTimeCounter := 1;	                           -- Start Transition
	elsif OffTimeCounter >= 1 then
		-- Forces ~500 nS dead time in between enabling muxes to ensure signals are not shorted.
		OffTimeCounter := OffTimeCounter + 1;
		-- Check for count to expire
		if OffTimeCounter > 10 then
			if AIHartMuxReg(12) = '0' then	            -- low mux enabled
				HA4 <= '1';
				H5 <= '0';
			else										            -- high mux enabled
				HA4 <= '0';
				H5 <= '1';
			end if;
			-- Reset count
			OffTimeCounter := 0;
		end if;
	end if;
	
	--Update address lines
	HA1 <= AIHartMuxReg(15);
	HA2 <= AIHartMuxReg(14);
	HA3 <= AIHartMuxReg(13);
	
end if;
end process UpdateAIHARTMUX;
-- END Update AI HART MUX state

    HB1 <= HA1;
	HB2 <= HA2;
	HB3 <= HA3;
	HB4 <= HA4;
	

end main;