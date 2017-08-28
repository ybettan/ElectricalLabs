library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

entity Scores is 
port ( 
	resetN 			: in std_logic ; 
	clk 			: in std_logic ; 
	brick_hit		: in std_logic ;--Whatever or not a brick was hit. If was hit, changes state.
	score_counter	: out std_logic_vector (99 downto 0)) ; --size probably is not true, need to check
	--time_count		: out std_logic_vector (6 downto 0) ; --Each game is up to 2 minutes, so 128 possible.
end Scores; 

architecture arc_Scores of Scores is 
	signal score_internal_count : integer ;
	signal brick_hit_state : std_logic ;
begin 
	score_counter <= std_logic_vector(to_unsigned(score_internal_count, score_counter'length));
	process ( resetN , clk) 
	begin 
		if resetN = '0' then 
			score_internal_count <= 0;
		elsif rising_edge(clk) then 
			if (brick_hit_state /= brick_hit) then
				brick_hit_state <= brick_hit;
				score_internal_count <= score_internal_count + 1;
			end if;
		end if; 
	end process; 
end architecture;