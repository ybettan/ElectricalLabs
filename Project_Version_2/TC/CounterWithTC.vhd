library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity CounterWithTC is 
port (
    clk   	:   in std_logic;
    RESETn  :   in std_logic;
	LOAD    :   in std_logic;
    Data    :   in std_logic_vector (6 downto 0);--Each game is up to 2 minutes, so 128 possible.
    TC      :   out std_logic;
    TIME_OUT:   out std_logic_vector (6 downto 0) );
end CounterWithTC;

architecture behavior of CounterWithTC is

	signal counter		: std_logic_vector (6 downto 0);
	constant time_max	: std_logic_vector (6 downto 0) := "1111000";--120
begin
	TIME_OUT <= counter;

    process (clk, RESETn)
    begin
        if (RESETn = '0') then
            counter <= "0000000";
        elsif (rising_edge(clk)) then
			if (LOAD = '1') then
                counter <= Data;
            elsif (counter = time_max) then
                counter <= "0000000";
            else
                counter <= counter + 1;
            end if;
		end if;
    end process;
      
    process (counter)
    begin
        if (counter = time_max) then
            TC <= '1';
        else
            TC <= '0';
        end if;
    end process;

end architecture;