library ieee;
use ieee.std_logic_1164.all
use ieee.std_logic_unsigned.all
use ieee.std_logic_arith.all

entity offset_to_int is 
port (
    din        	:   in std_logic_vector (7 downto 0);
    dout     	:   out std_logic_vector (3 downto 0);
);
end offset_to_int;

architecture arc_offset_to_int of arc_offset_to_int is
begin
    process (din)
    begin
        if (din(7) = '0') then
            dout <= din (7 downto 0) + 128;
        else
			dout <= din (7 downto 0) - 128;
        end if;
    end process;
end architecture;


