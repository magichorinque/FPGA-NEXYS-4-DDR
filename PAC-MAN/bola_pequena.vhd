library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity bola_pequena is
    Port ( HAD : in  STD_LOGIC_VECTOR(9 downto 0);
           VAD : in  STD_LOGIC_VECTOR(8 downto 0);
			  EDS,E : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end bola_pequena;

architecture Behavioral of bola_pequena is

begin

process (VAD,HAD,EDS,y,x,E)

begin
if ( E = '1') then 
	if (VAD = (y-5)  and HAD >= (x-2)and HAD <=(x+2) ) THEN
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
	elsif (VAD = (y-4)  and HAD >= (x-3)and HAD <=(x+3) ) THEN
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
	elsif (VAD = (y-3)  and HAD >= (x-4)and HAD <=(x+4)  ) THEN
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
	elsif ((VAD >= (y-2) and VAD <= (y+2)) and HAD >= (x-5)and HAD <=(x+5)  ) THEN
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
	elsif (VAD = (y+3)  and HAD >= (x-4)and HAD <=(x+4) ) THEN
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
	elsif (VAD = (y+4)  and HAD >= (x-3)and HAD <=(x+3) ) THEN
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
	elsif (VAD = (y+5)  and HAD >= (x-2)and HAD <=(x+2) ) THEN
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

