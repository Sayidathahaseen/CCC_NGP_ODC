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

-- PROGRAM		"Quartus II"
-- VERSION		"Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Web Edition"
-- CREATED		"Wed Jan 04 14:18:04 2012"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY HealthyLogic IS 
	PORT
	(
		I_AM_HEALTHY :  IN  STD_LOGIC;
		TAKE_CONTROL :  IN  STD_LOGIC;
		ESC1_WDI_CPLD :  IN  STD_LOGIC;
		ESC2_WDI_CPLD :  IN  STD_LOGIC;
		PEER_IN_CONTROL :  IN  STD_LOGIC;
		IN_CONTROL :  IN  STD_LOGIC;
		MPC_RESET_NOT :  IN  STD_LOGIC;
		APP1_OPN_EN_NOT :  IN  STD_LOGIC;
		APP2_OPN_EN_NOT :  IN  STD_LOGIC;
		RST_OUT_NOT :  IN  STD_LOGIC;
		HEALTHY :  OUT  STD_LOGIC;
		HEALTHY_INV :  OUT  STD_LOGIC;
		CONTROL :  OUT  STD_LOGIC;
		CONTROL_INV :  OUT  STD_LOGIC;
		READY_LED :  OUT  STD_LOGIC;
		ACTIVE_LED :  OUT  STD_LOGIC
	);
END HealthyLogic;

ARCHITECTURE bdf_type OF HealthyLogic IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 
HEALTHY <= SYNTHESIZED_WIRE_6;
CONTROL <= SYNTHESIZED_WIRE_7;
CONTROL_INV <= SYNTHESIZED_WIRE_3;
ACTIVE_LED <= SYNTHESIZED_WIRE_7;
SYNTHESIZED_WIRE_5 <= '1';



PROCESS(TAKE_CONTROL,SYNTHESIZED_WIRE_0)
BEGIN
IF (SYNTHESIZED_WIRE_0 = '0') THEN
	SYNTHESIZED_WIRE_6 <= '0';
ELSIF (RISING_EDGE(TAKE_CONTROL)) THEN
	SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_5;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_2 <= NOT(APP2_OPN_EN_NOT AND APP1_OPN_EN_NOT);


SYNTHESIZED_WIRE_0 <= I_AM_HEALTHY AND MPC_RESET_NOT AND RST_OUT_NOT AND SYNTHESIZED_WIRE_2;



HEALTHY_INV <= NOT(SYNTHESIZED_WIRE_6);



SYNTHESIZED_WIRE_3 <= NOT(SYNTHESIZED_WIRE_7);



READY_LED <= SYNTHESIZED_WIRE_6 AND SYNTHESIZED_WIRE_3;


PROCESS(TAKE_CONTROL,PEER_IN_CONTROL)
BEGIN
IF (PEER_IN_CONTROL = '0') THEN
	SYNTHESIZED_WIRE_7 <= '0';
ELSIF (RISING_EDGE(TAKE_CONTROL)) THEN
	SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_5;
END IF;
END PROCESS;


END bdf_type;