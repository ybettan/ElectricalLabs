library ieee ;
use ieee.std_logic_1164.all ;

entity Random_Generator is 
port ( 
	resetN 		: in std_logic ; 
	clk 		: in std_logic ; 
	trigger 	: in std_logic ;
	Random		: out std_logic_vector (7 downto 0) );
end Random_Generator; 

architecture arc_Random_Generator of Random_Generator is 

begin 
	process ( resetN , clk) 
	begin 
		if resetN = '0' then 
			Random <= "00000000";
		elsif rising_edge(clk) then 
			
		end if; 
	end process; 
end architecture;