library ieee;
use ieee.std_logic_1164.all
use ieee.std_logic_unsigned.all
use ieee.std_logic_arith.all

entity unity is
port (
    din        	:   in std_logic_vector (7 downto 0);
    interval  	:   out std_logic_vector (7 downto 0);
    dout     	:   out std_logic_vector (7 downto 0);
);
end unity;

component offset_to_int is
        port (
             din  :  in std_logic_vector (7 downto 0);
             dout :  in std_logic_vector (7 downto 0);
        );
end component;
             
component int_to_offset is
        port (
             din  :  in std_logic_vector (7 downto 0);
             dout :  in std_logic_vector (7 downto 0);
        );
end component;

architecture unity of unity is
begin
    
   int_to_offset : bcddn port_map(
        din => din,
        dout => interval
    );

   offset_to_int : bcddn port_map(
        din => interval,
        dout => dout
    );

end architecture;


