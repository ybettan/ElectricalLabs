library ieee ;
use ieee.std_logic_1164.all ;

entity Brick_Breaker_Contoller is 
port ( 
	resetN 		: in std_logic ; 
	clk 		: in std_logic ; 
	TC	 		: in std_logic ; 
	din 		: in std_logic_vector (8 downto 0); 
	strike 		: in std_logic ; 
	hit_kind	: in std_logic_vector (2 downto 0) ;--4 possible brick edges, 3 possible walls, 1 racket
	make 		: in std_logic;
	break		: in std_logic;
	CTRL_resetN	: out std_logic ; 
	PAUSE_CON	: out std_logic ; 
	EXIT_GAME 	: out std_logic ;
	brick_hit 	: out std_logic ;
	LVL_DIFF	: out std_logic_vector (1 downto 0) ); 
end Brick_Breaker_Contoller; 

architecture arc_Brick_Breaker_Contoller of Brick_Breaker_Contoller is 
	constant PAUSE 			: std_logic := '0';
	constant CONTINUE 		: std_logic := '1';
	--next 3 lines should be identical in Brick_Breaker_Contoller and Bricks_Memory
	constant LVL_NOVICE 	: std_logic_vector (1 downto 0) := "00";
	constant LVL_MEDIUM 	: std_logic_vector (1 downto 0) := "01";
	constant LVL_DIFFICULT 	: std_logic_vector (1 downto 0) := "10";
	signal pressed			: std_logic := '0'; 
	signal CONTINUE_or_PAUSE: std_logic;
begin 
	PAUSE_CON <= CONTINUE_or_PAUSE;
	process ( resetN , clk) 
	begin 
		if resetN = '0' then 
			CTRL_resetN <= '0';
			CONTINUE_or_PAUSE <= PAUSE; 
			EXIT_GAME <= '0';
			LVL_DIFF <= LVL_NOVICE;
			CONTINUE_or_PAUSE <= PAUSE;
			pressed <= '0'; 
		elsif rising_edge(clk) then 
			CTRL_resetN <= '1';--don't reset
			if ((make = '1') and (pressed ='0')) then
				pressed <= '1';
				if (din = "000101101") then--R press, 2D
					CONTINUE_or_PAUSE <= not CONTINUE_or_PAUSE;
					CTRL_resetN <= '0';
					CONTINUE_or_PAUSE <= PAUSE; 
					EXIT_GAME <= '0';
					LVL_DIFF <= LVL_NOVICE;
					CONTINUE_or_PAUSE <= PAUSE;
				elsif (din = "000101001") then--SPACE press, 29
					CONTINUE_or_PAUSE <= not CONTINUE_or_PAUSE;
				end if;
			elsif (break = '1') then 
				pressed <= '0';
			end if;
			
			
		end if; 
	end process; 
end architecture;