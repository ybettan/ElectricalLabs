library ieee;
use ieee.std_logic_1164.all
use ieee.std_logic_unsigned.all
use ieee.std_logic_arith.all

entity int_to_offset is 
port (
    din        	:   in std_logic_vector (7 downto 0);
    dout     	:   out std_logic_vector (3 downto 0);
);
end int_to_offset;

architecture arc_int_to_offset of int_to_offset is
begin
    process (din)
    begin
        if (din(7) = '0') then
            dout <= din (7 downto 0) - 128;
        else
			dout <= din (7 downto 0) + 128;
        end if;
    end process;
end architecture;


