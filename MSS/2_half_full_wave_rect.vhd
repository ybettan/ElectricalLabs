library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
entity half_full_wave_rect is
port (
	CLK         : in std_logic ; -- input clock
	resetN      : in std_logic ; -- reset bit
	mode        : in std_logic_vector(2 downto 0) ;
	data_in     : in signed integer range -128 to 127
	data_out    : out signed integer range -128 to 127
);
end half_full_wave_rect;

architecture arc_half_full_wave_rect of half_full_wave_rect is
begin
    process (CLK,resetN)
	    variable tmp     : in signed integer range -128 to 127
    begin
        if (resetN = '0') then
            data_out <= 0; 
        elsif (rising_edge(CLK)) then
			case mode is
				when "000" => --Bypass: don't make any changes
					data_out <= data_in;
				when "001" =>  --Invert: flip the signal
					data_out <= data_out * (-1);
				when "010" =>  --Full Wave
					data_out <= abs(data_in);
				when "011" =>  --Half Wave
                    if (data_out < 0) then
                        data_out <= 0;
                    else
                        data_out <= data_in;
                    end if;
				when "100" =>  --Quantization-2: turn 2 bottom bits to zero
					data_out <= data_in (7 downto 2) & "00";
				when "101" =>  --Quantization-4: turn 4 bottom bits to zero
					data_out <= data_in (7 downto 4) & "0000";
				when "110" =>  --Half: divide the number by 2
					data_out <= "0" & data_in (7 downto 1);
				when "111" =>  --Triple: triple the number
					tmp := data_out * 3; 
					if (tmp > 127) then
						tmp := 127;
					elsif (tmp < -128) then
						tmp := -128;
					end if;
					data_out <= tmp;
			end case;
        end if;
    end process;
end architecture;
