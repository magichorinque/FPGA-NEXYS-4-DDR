library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--use UNISIM.VComponents.all;

entity Monito is
    Port ( VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  x,y : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			 );
end Monito;

architecture Behavioral of Monito is

BEGIN process (VAD,HAD,EDS,x,y)

begin
 if (VAD = (y-10) and HAD >= (x-2) and HAD <= (x+1)) THEN
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
	elsif (VAD = (y-9) and HAD >= (x-4) and HAD <= (x+3)) THEN
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
	elsif (VAD = (y-8) and HAD >= (x-6) and HAD <= (x+5)) THEN
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
	elsif (VAD = (y-7) and HAD >= (x-7) and HAD <= (x+6)) THEN
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
	elsif (VAD >= (y-6) and VAD <= (y-5) and HAD >= (x-8) and HAD <= (x+7)) THEN
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
	elsif (VAD >= (y-4) and VAD <= (y-3) and  HAD >= (x-9) and HAD <= (x+8)) THEN
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
	elsif (VAD >= (y-2) and VAD <= (y+2) and  HAD >= (x-10) and HAD <= (x+9)) THEN
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
elsif (VAD >= (y+3)	and VAD <= (y+4) and  HAD >= (x-9) and HAD <= (x+8)) THEN
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
	elsif (VAD >= (y+5)	and VAD <= (y+6) and  HAD >= (x-8) and HAD <= (x+7)) THEN
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
	elsif (VAD = (y+7) and  HAD >= (x-7) and HAD <= (x+6)) THEN
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
	elsif (VAD = (y+8) and  HAD >= (x-6) and HAD <= (x+5)) THEN
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
	elsif (VAD = (y+9) and  HAD >= (x-4) and HAD <= (x+3)) THEN
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
	elsif (VAD = (y+10) and  HAD >= (x-2) and HAD <= (x+1)) THEN
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

