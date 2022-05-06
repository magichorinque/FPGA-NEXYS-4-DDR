library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Escenario is
    Port (  VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end Escenario;

architecture Behavioral of Escenario is

begin
process (VAD,HAD,EDS)

begin
 
---------------------------------------------------------
----CONTORNO
---------------------------------------------------------
 if (VAD = 16 and HAD >= 104 and HAD <= 312) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 16 and HAD >= 328 and HAD <= 536) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 104 or HAD = 536) and VAD >= 16 and VAD <= 160) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 312 or HAD = 328) and VAD >= 16 and VAD <= 80) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 160 and HAD >= 104 and HAD <= 184) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 160 and HAD >= 456 and HAD <= 536) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 208 and HAD >= 104 and HAD <= 184) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 208 and HAD >= 456 and HAD <= 536) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 240	and HAD >= 104 and HAD <= 184) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 240 and HAD >= 456 and HAD <= 536) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 288 and HAD >= 104 and HAD <= 184) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 288 and HAD >= 456 and HAD <= 536) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 368 and HAD >= 104 and HAD <= 136) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 368 and HAD >= 504 and HAD <= 536) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 384 and HAD >= 104 and HAD <= 136) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 384 and HAD >= 504 and HAD <= 536) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 464 and HAD >= 104 and HAD <= 536) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (VAD = 80 and HAD >= 312 and HAD <= 328) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 184 and VAD >= 160 and VAD <= 208) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 456 and VAD >= 160 and VAD <= 208) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 184 and VAD >= 240 and VAD <= 288) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 456 and VAD >= 240 and VAD <= 288) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 104 and VAD >= 288 and VAD <= 368) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 536 and VAD >= 288 and VAD <= 368) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 104 and VAD >= 384 and VAD <= 464) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 536 and VAD >= 384 and VAD <= 464) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 136 and VAD >= 368 and VAD <= 384) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif (HAD = 504 and VAD >= 368 and VAD <= 384) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
---------------------------------------------------------
----CONTORNO
---------------------------------------------------------
---------------------------------------------------------
----Cuadros
---------------------------------------------------------
	elsif ((VAD = 48 or VAD = 80) and ( (HAD >= 136 and HAD <= 184) or (HAD >= 216 and HAD <= 280) or (HAD >= 360 and HAD <= 424) or (HAD >= 456 and HAD <= 504) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 136 or HAD = 184 or HAD = 216 or HAD = 280 or HAD = 360 or HAD = 424 or HAD = 456 or HAD = 504) and VAD >= 48 and VAD <= 80) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
---------------------------------------------------------
----Cuadros
---------------------------------------------------------
---------------------------------------------------------
----Top
---------------------------------------------------------
elsif ((VAD = 112 or VAD = 128 or VAD = 320) and ((HAD >= 136 and HAD <= 184) or (HAD >= 456 and HAD <= 504))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
elsif ((VAD = 112 or VAD = 208 or VAD = 240 or VAD = 272 or VAD = 368) and ((HAD >= 264 and HAD <= 376))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
elsif ((VAD = 128 or VAD = 288 or VAD = 384) and ((HAD >= 264 and HAD <= 312) or (HAD >= 328 and HAD <= 376))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;	
elsif (( VAD = 112 or VAD = 208 or VAD = 240 or VAD = 288 or VAD = 368 ) and (  ( HAD >= 216 and HAD <= 232 ) or ( HAD >= 408 and HAD <= 424 ) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 136 or HAD = 184 or HAD = 264 or HAD = 376 or HAD = 456 or HAD = 504) and VAD >= 112 and VAD <= 128) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 216 or HAD = 424 )and ((VAD >= 112 and VAD <= 208) or (VAD >= 240 and VAD <= 288) or (VAD >= 320 and VAD <= 336) or (VAD >= 368 and VAD <= 416))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 232 or HAD = 408) and ((VAD >= 112 and VAD <= 160) or (VAD >= 176 and VAD <= 208) or (VAD >= 240 and VAD <= 288) or (VAD >= 368 and VAD <= 416))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 264 or HAD = 376) and ( (VAD >= 208 and VAD <= 240) or (VAD >= 272 and VAD <= 288) or  (VAD >= 368 and VAD <= 384))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 280 or HAD = 360) and (VAD >= 160 and VAD <= 176)) then 
	R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 312 or HAD = 328)  and ((VAD >= 128 and VAD <= 176) or (VAD >= 288 and VAD <= 336) or (VAD >= 384 and VAD <= 432))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((VAD = 176 or VAD = 336 or VAD = 432 ) and HAD >= 312 and HAD <= 328) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((VAD = 176 or VAD = 160) and ((HAD >= 232 and HAD <= 280) or (HAD >= 360 and HAD <= 408) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((VAD = 320 or VAD = 336) and ((HAD >= 216 and HAD <= 280) or (HAD >= 360 and HAD <= 424) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 136 or HAD = 216 or HAD = 280 or HAD = 360 or HAD = 424 or HAD = 504) and ((VAD >= 320 and VAD <= 336))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((VAD = 416) and ((HAD >= 136 and HAD <= 216) or (HAD >= 232 and HAD <= 280) or (HAD >= 360 and HAD <= 408) or (HAD >= 424 and HAD <= 504))) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((VAD = 432 ) and ((HAD >= 136 and HAD <= 280) or (HAD >= 360 and HAD <= 504) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 168 or HAD = 472 ) and ((VAD >= 336 and VAD <= 384) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 184 or HAD = 456 ) and ((VAD >= 320 and VAD <= 384) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((HAD = 136 or HAD = 280 or HAD = 360 or HAD = 504 ) and ((VAD >= 416 and VAD <= 432) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((VAD = 336 ) and ((HAD >= 136 and HAD <= 168) or (HAD >= 472 and HAD <= 504) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
	elsif ((VAD = 384 ) and ((HAD >= 168 and HAD <= 184) or (HAD >= 456 and HAD <= 472) )) THEN
   R <=(others => '0'); 
   G <=(others => '0');
   B(0) <= '1' and EDS;
	B(1) <= '1' and EDS;
	B(2) <= '1' and EDS;
	B(3) <= '1' and EDS;
---------------------------------------------------------
----Top
---------------------------------------------------------
	else 
	R <=(others => '0'); 
   G <=(others => '0');
   B <=(others => '0');
end if;
 END PROCESS;

end Behavioral;

