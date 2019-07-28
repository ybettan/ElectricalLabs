library ieee ;
use ieee.std_logic_1164.all ;
use IEEE.NUMERIC_STD.all;

entity Ball_Logic is 
port ( 
	resetN 		: in std_logic ; 
	clk 		: in std_logic ; 
	din			: in std_logic_vector (2 downto 0) ;--Hit kind
	--next 2 lines should be identical in Brick_Breaker_Contoller and Ball_Logic
	ball_x		: out std_logic_vector (9 downto 0) ; --size probably is not true, need to check
	ball_y		: out std_logic_vector (9 downto 0) ); --size probably is not true, need to check
end Ball_Logic; 

architecture arc_Ball_Logic of Ball_Logic is 
	constant default_ball_Y 		: integer := 440;
	constant default_ball_X 		: integer := 320;
	signal current_X 				: integer range 0 to 639 := 320;
	signal current_Y 				: integer range 0 to 639 := 440;
begin 
	ball_x <= std_logic_vector(to_signed(current_X, ball_x'length));
	ball_y <= std_logic_vector(to_signed(current_Y, ball_y'length));
	
	process ( RESETn , clk) 
	begin 
		if (RESETn = '0') then 
			current_X <= default_ball_X;
			current_Y <= default_ball_Y;
		elsif rising_edge(clk) then 
			
		end if; 
	end process; 
end architecture;