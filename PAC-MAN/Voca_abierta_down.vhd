library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Voca_abierta_down is
    Port ( VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end Voca_abierta_down;

architecture Behavioral of Voca_abierta_down is

begin
process (VAD,HAD,EDS,y,x)

begin
	if (HAD = (x-10)  and VAD >= (y-2)and VAD <=(y+1) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x-9)  and VAD >= (y-4)and VAD <=(y+3) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x-8)  and VAD >= (y-6)and VAD <=(y+5) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x-7)  and VAD >= (y-7)and VAD <=(y+6) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x-6)  and VAD >= (y-8)and VAD <=(y+5) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x-5)  and VAD >= (y-8)and VAD <=(y+3) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x-4)  and VAD >= (y-9)and VAD <=(y+1) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x-3) and VAD >= (y-9)   and VAD <=(y) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x-2) and VAD >= (y-10)and VAD <=(y-2) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif ((HAD = (x-1) or  HAD = (x))   and VAD >= (y-10)and VAD <=(y-3) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+1)  and VAD >= (y-10)and VAD <=(y-2) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+2)  and VAD >= (y-9)and VAD <=(y) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+3)  and VAD >= (y-9)and VAD <=(y+1) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+4)  and VAD >= (y-8)and VAD <=(y+3) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+5)  and VAD >= (y-8)and VAD <=(y+5) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+6)  and VAD >= (y-7)and VAD <=(y+6) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+7)  and VAD >= (y-6)and VAD <=(y+5) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+8)  and VAD >= (y-4)and VAD <=(y+3) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	elsif (HAD = (x+9)  and VAD >= (y-2)and VAD <=(y+1) ) THEN
   R(0) <= '1' and EDS; 
	R(1) <= '1' and EDS;
	R(2) <= '1' and EDS;
	R(3) <= '1' and EDS;
   G(0) <= '1' and EDS;
	G(1) <= '1' and EDS;
	G(2) <= '1' and EDS;
	G(3) <= '1' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
	else 
	R(0) <= '0' and EDS; 
	R(1) <= '0' and EDS;
	R(2) <= '0' and EDS;
	R(3) <= '0' and EDS;
   G(0) <= '0' and EDS;
	G(1) <= '0' and EDS;
	G(2) <= '0' and EDS;
	G(3) <= '0' and EDS;
   B(0) <= '0' and EDS;
	B(1) <= '0' and EDS;
	B(2) <= '0' and EDS;
	B(3) <= '0' and EDS;
end if;
 END PROCESS;

end Behavioral;

