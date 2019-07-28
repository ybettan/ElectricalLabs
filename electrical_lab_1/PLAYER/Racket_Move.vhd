library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- Alex Grinshpun March 24 2017 

entity Racket_Move is
port 	(
		CLK				: in std_logic;
		timer_done		: in std_logic;
		I_objectStartX	: in integer range 0 to 680;
		I_objectStartY	: in integer range 0 to 512;
		O_objectStartX	: out integer;
		O_objectStartY	: out integer
	);
end Racket_Move;

architecture behav of Racket_Move is 



begin


		process (CLK)
		begin
		if CLK'event  and CLK = '1' then
	    	if timer_done = '1' then
                O_objectStartX <= I_objectStartX;
                O_objectStartY <= I_objectStartY;
			end if;
		end if;
		end process ;

end behav;
