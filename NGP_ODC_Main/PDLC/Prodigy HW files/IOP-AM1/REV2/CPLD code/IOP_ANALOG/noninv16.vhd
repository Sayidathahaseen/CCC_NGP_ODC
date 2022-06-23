library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity noninv16 is
  port ( 
         input            : in  std_logic_vector (15 downto 0) ;
         output           : out std_logic_vector (15 downto 0) );
end noninv16;

architecture rtl16 of noninv16 is
begin  --  rtl16

output <= transport input ;
      
end rtl16;


