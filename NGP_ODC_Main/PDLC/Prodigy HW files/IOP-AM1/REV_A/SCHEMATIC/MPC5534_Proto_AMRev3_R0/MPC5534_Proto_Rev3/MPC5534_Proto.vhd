-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;

entity MPC5534_Proto is
	port
	(
		I_AM_HEALTHY : in std_logic;
		TAKE_CONTROL : in std_logic;
		MPC_CLK_OUT : in std_logic;
		MPC_ENG_CLK : in std_logic;
		MPC_RESET_NOT : in std_logic;
		RST_OUT_NOT : in std_logic;
		APP1_OPN_EN_NOT : in std_logic;
		APP2_OPN_EN_NOT : in std_logic;
		ESC1_WDI_CPLD : in std_logic;
		ESC2_WDI_CPLD : in std_logic;
		ESC1_GPIO : in std_logic;
		ESC2_GPIO : in std_logic;
		IOP_TO_IOP_SRH1 : in std_logic;		
		IOP_TO_IOP_SRH2 : in std_logic;
		IOP_TO_IOP_SRH3 : in std_logic;
		IOP_TO_IOP_SRH4 : in std_logic;
		PEER_IN_CONTROL : in std_logic;
		IN_CONTROL : in std_logic;
	
		HEALTHY : out std_logic;
		HEALTHY_INV : out std_logic;
		READY_LED : out std_logic;
		CONTROL : out std_logic;
		CONTROL_INV : out std_logic;
		ACTIVE_LED : out std_logic;
		
		PLD_SPARE2 : in std_logic;
		PLD_SPARE1 : in std_logic
	);

end MPC5534_Proto;

architecture ppl_type of MPC5534_Proto is

-- Component declaration for healthy logic
COMPONENT HealthyLogic
	PORT
	(
		I_AM_HEALTHY		:	 IN STD_LOGIC;
		TAKE_CONTROL		:	 IN STD_LOGIC;
		ESC1_WDI_CPLD		:	 IN STD_LOGIC;
		ESC2_WDI_CPLD		:   IN STD_LOGIC;
		PEER_IN_CONTROL		:	 IN STD_LOGIC;
		IN_CONTROL		:	 IN STD_LOGIC;
		MPC_RESET_NOT		:	 IN STD_LOGIC;
		APP1_OPN_EN_NOT		:	 IN STD_LOGIC;
		APP2_OPN_EN_NOT		:	 IN STD_LOGIC;
		RST_OUT_NOT		:	 IN STD_LOGIC;
		PLD_SPARE1_CONTROL	:   IN STD_LOGIC;
		HEALTHY		:	 OUT STD_LOGIC;
		HEALTHY_INV		:	 OUT STD_LOGIC;
		CONTROL		:	 OUT STD_LOGIC;
		CONTROL_INV		:	 OUT STD_LOGIC;
		READY_LED		:	 OUT STD_LOGIC;
		ACTIVE_LED		:	 OUT STD_LOGIC
	);
END COMPONENT;

begin

--Instantiate HealthyLogic.vhd (generated from HealthyLogic.bdf)
HealthyLogic_inst : HealthyLogic PORT MAP (

		I_AM_HEALTHY =>		I_AM_HEALTHY,
		TAKE_CONTROL => 		TAKE_CONTROL,
		ESC1_WDI_CPLD => 		ESC1_WDI_CPLD,
		ESC2_WDI_CPLD => 		ESC2_WDI_CPLD,
		PEER_IN_CONTROL => 	PEER_IN_CONTROL,
		IN_CONTROL => 			IN_CONTROL,
		MPC_RESET_NOT => 		MPC_RESET_NOT,
		APP1_OPN_EN_NOT =>	APP1_OPN_EN_NOT,
		APP2_OPN_EN_NOT =>	APP2_OPN_EN_NOT,
		RST_OUT_NOT =>			RST_OUT_NOT,
		PLD_SPARE1_CONTROL =>PLD_SPARE1,
		HEALTHY =>				HEALTHY,
		HEALTHY_INV =>			HEALTHY_INV,
		CONTROL =>				CONTROL,
		CONTROL_INV =>			CONTROL_INV,
		READY_LED =>			READY_LED,
		ACTIVE_LED =>			ACTIVE_LED
	);

--READY_LED <= I_AM_HEALTHY;
--HEALTHY <= I_AM_HEALTHY;
--HEALTHY_INV <= not I_AM_HEALTHY;
--ACTIVE_LED <= TAKE_CONTROL;
--CONTROL <= TAKE_CONTROL;
--CONTROL_INV <= not TAKE_CONTROL;

end;
