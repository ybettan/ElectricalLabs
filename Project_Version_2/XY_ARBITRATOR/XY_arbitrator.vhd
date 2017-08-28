library ieee ;
use ieee.std_logic_1164.all ;

entity XY_arbitrator is 
port ( 
	resetN 		: in std_logic ; 
	clk 		: in std_logic ; 
	x0_cor		: in std_logic_vector (99 downto 0) ; --size probably is not true, need to check
	y0_cor		: in std_logic_vector (99 downto 0) ; --size probably is not true, need to check
	xf_cor		: in std_logic_vector (99 downto 0) ; --size probably is not true, need to check
	yf_cor		: in std_logic_vector (99 downto 0) ; --size probably is not true, need to check
	brick_row	: out std_logic_vector (99 downto 0) ); --size probably is not true, need to check
end XY_arbitrator; 

architecture arc_XY_arbitrator of XY_arbitrator is 

begin 
	process ( resetN , clk) 
	begin 
		if resetN = '0' then 
			--brick_row <= "00000000";
		elsif rising_edge(clk) then 
			
		end if; 
	end process; 
end architecture;